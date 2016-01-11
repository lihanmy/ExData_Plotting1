library(dplyr)

df <- read.table("household_power_consumption.txt",header = T,
                 sep=";",na.strings = "?")
df <- tbl_df(df)
df$Date <- as.Date(df$Date,"%d/%m/%Y")
sel_df <- filter(df,Date == "2007-02-01" | Date == "2007-02-02")

hist(sel_df$Global_active_power,col="Red",
     xlab="Global active power (kilowatts)",
     main ="Global active power")
dev.copy(png,"plot1.png")
dev.off()
