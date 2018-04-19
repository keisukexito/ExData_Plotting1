## Exploratory Data Analysis Course Project 1
## With "Individual household electric power consumption Data Set???
## Scripts to create Plot 1

## Reading source file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)

## Subset the table by dates "1/2/2007" and "2/2/2007"
epc2 <- epc[(epc$Date == "1/2/2007" |epc$Date == "2/2/2007"),]

## Create a new variable "datetime" which combines "Date" & "Time" in "POSIXct" class
epc2$datetime <- as.POSIXct(paste(epc2$Date,epc2$Time), format="%d/%m/%Y %H:%M:%S")

## Generate Plot1 
par(mfrow=c(1,1))
with(epc2, hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))

## Copy Plot1 to a PNG format file "plot1.png"
dev.copy(png, file="plot1.png")
dev.off()