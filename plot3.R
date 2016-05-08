# R Script for creating plot3.png for the "Exploratory Data Analysis Class Assignment #1
# May 8, 2016
# Belen Laurente

# Load libraries
library(lubridate)
library(dplyr)

# Set the working directory
# - assumes that the file household_power_consumption.txt is in it, unzipped
setwd("C:/Development/ExploratoryDataAnalysis/Week1/data2")

# Read in the table and then subset to retain just the relevant days
df <- read.csv2 ("household_power_consumption.txt", stringsAsFactors=FALSE)
power <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
rm(df)

# Convert dates and numbers
power <- mutate(power, realdate=dmy_hms(paste(power$Date, power$Time, sep=" ")))
power <- mutate(power, gapnum = as.numeric(Global_active_power), grpnum = as.numeric(Global_reactive_power))
power <- mutate(power, subm1 = as.numeric(Sub_metering_1), subm2 = as.numeric(Sub_metering_2), subm3 = as.numeric(Sub_metering_3))
power <- mutate(power, voltnum = as.numeric(Voltage))

# Generate Plot3
png(filename="plot3.png", width=480, height=480)
par(mar=c(2,4,2,1))
plot(power$realdate, power$subm1, type="l", ylab="Energy sub metering")
lines(power$realdate, power$subm2, col="red")
lines(power$realdate, power$subm3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1))
dev.off()





