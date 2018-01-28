## Setting up the working directory
setwd("~/exdata%2Fdata%2Fhousehold_power_consumption")

##Plot1

plot1datafile <- "./household_power_consumption.txt"

plot1data <- read.table(plot1datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the data needed
subsetdata <- plot1data[plot1data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

##getting the plot
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
