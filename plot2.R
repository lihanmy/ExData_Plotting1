library(dplyr)

dt <- read.table("household_power_consumption.txt",header = T,
                 sep=";",na.strings = "?")
df <- tbl_df(dt)
df$Date <- as.Date(df$Date,"%d/%m/%Y")

sel_df <- filter(df,Date == "2007-02-01" | Date == "2007-02-02")
sel_df$newtime <- strptime(paste(sel_df$Date,sel_df$Time),"%Y-%m-%d %H:%M:%S")

with(sel_df, {
    plot(newtime,Global_active_power,type = "n",
         ylab="Global active power (kilowatts)",
         xlab="")
    lines(newtime,Global_active_power)
})
dev.copy(png,"plot2.png")
dev.off()
