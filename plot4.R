## Exploratory Data Analysis Course Project 1
## With "Individual household electric power consumption Data Set???
## Scripts to create Plot4

## Reading source file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)

## Subset the table by dates "1/2/2007" and "2/2/2007"
epc2 <- epc[(epc$Date == "1/2/2007" |epc$Date == "2/2/2007"),]

## Create a new variable "datetime" which combines "Date" & "Time" in "POSIXct" class
epc2$datetime <- as.POSIXct(paste(epc2$Date,epc2$Time), format="%d/%m/%Y %H:%M:%S")

## Generate Plot4
par(mfcol=c(2,2))
with(epc2, plot(datetime, Global_active_power, type="l", xlab = "", ylab="Global Active Power"))
with(epc2, {
    plot(datetime, Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
    points(datetime, Sub_metering_1,col="black", type="l")
    points(datetime, Sub_metering_2,col="red", type="l")
    points(datetime, Sub_metering_3,col="blue", type="l")
    legend("topright", lty=1, bty="n", cex = 0.75, col=c("black","red","blue"),legend=c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
})
with(epc2, plot(datetime, Voltage, type="l"))
with(epc2, plot(datetime, Global_reactive_power, type="l"))

## Copy Plot4 to a PNG format file "plot4.png"
dev.copy(png, file="plot4.png")
dev.off()