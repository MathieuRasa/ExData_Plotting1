## Setting working directory
dir <- "C:/Users/User/Desktop/01. Private/09. Online classes/2. Coursera/Working directory/2. Data/2. Exploratory analysis - Course project #1"
setwd(dir)

## Reading the table and subsetting arround the right dates
library(data.table)
initial <- read.table("household_power_consumption.txt", nrows = 100)
classes <- sapply(initial, class)
HPC <- read.table("household_power_consumption.txt", header = T, nrows = 2075259, colClasses = classes, sep = ";", na.strings = "?", stringsAsFactors=F)
HPCf <-rbind(HPC[HPC$Date == "1/2/2007",], HPC[HPC$Date == "2/2/2007",])

## Convert to dates and time and create an additional column
HPCf$DateTime <- as.POSIXct(strptime(paste(HPCf$Date, HPCf$Time), format="%d/%m/%Y %H:%M:%S"))

## Creating the plot
par(mar=c(3,4.1,2.5,2.1), cex = 0.9)
with(HPCf, plot(DateTime, Sub_metering_1, main = NA, xlab = NA, ylab = "Energy sub metering", type = "n"))
with(HPCf, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(HPCf, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(HPCf, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'),lty=1)

## Create a PNG copy
dev.copy(png, file = "plot3.png") 
dev.off()