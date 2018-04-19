## Exploratory Data Analysis Course Project 1
## With "Individual household electric power consumption Data Set???
## Scripts to create Plot3

## Reading source file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)

## Subset the table by dates "1/2/2007" and "2/2/2007"
epc2 <- epc[(epc$Date == "1/2/2007" |epc$Date == "2/2/2007"),]

## Create a new variable "datetime" which combines "Date" & "Time" in "POSIXct" class
epc2$datetime <- as.POSIXct(paste(epc2$Date,epc2$Time), format="%d/%m/%Y %H:%M:%S")

## Generate Plot3
par(mfrow=c(1,1))
with(epc2, {
    plot(datetime, Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
    points(datetime, Sub_metering_1,col="black", type="l")
    points(datetime, Sub_metering_2,col="red", type="l")
    points(datetime, Sub_metering_3,col="blue", type="l")
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
})
## Copy Plot3 to a PNG format file "plot3.png"
dev.copy(png, file="plot3.png")
dev.off()