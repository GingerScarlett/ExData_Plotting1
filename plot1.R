# R Script for creating plot1.png for the "Exploratory Data Analysis Class Assignment #1
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
power <- mutate(power, gapnum = as.numeric(Global_active_power), grpnum = as.numeric(Global_reactive_power))
power <- mutate(power, subm1 = as.numeric(Sub_metering_1), subm2 = as.numeric(Sub_metering_2), subm3 = as.numeric(Sub_metering_3))
power <- mutate(power, voltnum = as.numeric(Voltage))

# Generate Plot1
png(filename="plot1.png", width=480, height=480)
hist(power$gapnum, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()





