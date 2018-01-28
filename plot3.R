## Setting up the working directory
setwd("~/exdata%2Fdata%2Fhousehold_power_consumption")

##Plot3

plot3datafile <- "./household_power_consumption.txt"

plot3data <- read.table(plot3datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the data needed
subsetdata <- plot3data[plot3data$Date %in% c("1/2/2007","2/2/2007") ,]

##
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

##getting the plot

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()