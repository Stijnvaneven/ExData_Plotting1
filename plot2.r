library(dplyr)

# # Load the data about household power consumption
dataFileName <- "household_power_consumption.txt"
HPC<-read.table(dataFileName, header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

#select rows for Date = '1/2/2007' OR Date = '2/2/2007'
HPC.SubsetDates<-subset(HPC, Date == "1/2/2007"| Date == "2/2/2007")

#plot #2
# this step leads to an empty string if stringAsFactors is TRUE.
datetime<-strptime( paste(HPC.SubsetDates$Date, HPC.SubsetDates$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, HPC.SubsetDates$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

