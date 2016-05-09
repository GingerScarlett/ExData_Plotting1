# R Script for creating plot4.png for the "Exploratory Data Analysis Class Assignment #1
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

# Generate Plot4
png(filename="plot4.png", width=480, height=480)
# set the margins and layout of the graphs
par(mar=c(4,5,2,1))
par(mfcol=c(2,2))
# first graph
plot(power$realdate, power$gapnum, type="l", ylab="Global Active Power", xlab="")
# second graph
plot(power$realdate, power$subm1, type="l", ylab="Energy sub metering", xlab="")
lines(power$realdate, power$subm2, col="red")
lines(power$realdate, power$subm3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1), bty="n")
# third graph
plot(power$realdate, power$voltnum, type="l", ylab="Voltage", xlab="datetime", yaxt="n")
axis(2, at=c(234,236,238,240,242,244,246), labels=c("234","","238","","242","","246"))
#fourth graph
plot(power$realdate, power$grpnum, type="l", ylab="Global_reactive_power", xlab="datetime")
#close the device
dev.off()





