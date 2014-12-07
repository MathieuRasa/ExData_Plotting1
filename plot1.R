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

## Creating the histogram
par(mar=c(4.5,4.1,3,2.1))
hist(HPCf$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", cex.axis = 0.7, cex.lab = 0.7, cex.main = 0.9)

## Create a PNG copy
dev.copy(png, file = "plot1.png") 
dev.off()