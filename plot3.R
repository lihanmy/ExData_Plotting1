library(dplyr)

dt <- read.table("household_power_consumption.txt",header = T,
                 sep=";",na.strings = "?")
df <- tbl_df(dt)
df$Date <- as.Date(df$Date,"%d/%m/%Y")

sel_df <- filter(df,Date == "2007-02-01" | Date == "2007-02-02")
sel_df$newtime <- strptime(paste(sel_df$Date,sel_df$Time),"%Y-%m-%d %H:%M:%S")
par(mfcol = c(1,1))
with(sel_df, {
    plot(newtime,Sub_metering_1,type = "n",
         ylab="Energy sub metering",
         xlab="")
    lines(newtime,Sub_metering_1,col="black")
    lines(newtime,Sub_metering_2,col="red")
    lines(newtime,Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),cex = 0.7,
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.copy(png,"plot3.png")
dev.off()
