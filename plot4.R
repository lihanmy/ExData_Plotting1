library(dplyr)

dt <- read.table("household_power_consumption.txt",header = T,
                 sep=";",na.strings = "?")
df <- tbl_df(dt)
df$Date <- as.Date(df$Date,"%d/%m/%Y")

sel_df <- filter(df,Date == "2007-02-01" | Date == "2007-02-02")
sel_df$datetime <- strptime(paste(sel_df$Date,sel_df$Time),"%Y-%m-%d %H:%M:%S")


par(mfcol = c(2,2))
par(mar = c(4,4,2,1))
with(sel_df, {
    plot(datetime,Global_active_power,type = "l",
         ylab="Global active power",xlab="")
    plot(datetime,Sub_metering_1,type = "l",
         ylab="Energy sub metering",col="black",xlab="")
    lines(datetime,Sub_metering_2,col="red")
    lines(datetime,Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),cex = 0.5,
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(datetime,Voltage,type = "l",
         ylab="Votage",xlab="datetime")
    plot(datetime,Global_reactive_power,type = "l",
         ylab="Global reactive power",xlab="datetime")
})
dev.copy(png,"plot4.png")
dev.off()
