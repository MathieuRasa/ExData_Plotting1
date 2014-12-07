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
plot(HPCf$DateTime, HPCf$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = NA, type = "l")

## Create a PNG copy
dev.copy(png, file = "plot2.png") 
dev.off()