# create plot #3

# file to get data and read the data
dataFileName <- "household_power_consumption.txt"
HPC<-read.table(dataFileName, header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

#select rows for Date = '1/2/2007' OR Date = '2/2/2007'
HPC.SubsetDates<-subset(HPC, Date == "1/2/2007"| Date == "2/2/2007")

# combine date and time, and format as asked by assignment
# vector of date and time points over the 2 days
datetime <- strptime(paste(HPC.SubsetDates$Date, HPC.SubsetDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#
globalActivePower <- as.numeric(HPC.SubsetDates$Global_active_power)
subMetering1 <- as.numeric(HPC.SubsetDates$Sub_metering_1)
subMetering2 <- as.numeric(HPC.SubsetDates$Sub_metering_2)
subMetering3 <- as.numeric(HPC.SubsetDates$Sub_metering_3)


png("plot3.png", width=480, height=480)
# create base plot and the file with the submetering1 line
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
# add the bother 2 submetering lines to the plot
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()