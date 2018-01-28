## Setting up the working directory
setwd("~/exdata%2Fdata%2Fhousehold_power_consumption")

##Plot2

plot2datafile <- "./household_power_consumption.txt"

plot2data <- read.table(plot2datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the data needed
subsetdata <- plot2data[plot2data$Date %in% c("1/2/2007","2/2/2007") ,]

##
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

##getting the plot
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()