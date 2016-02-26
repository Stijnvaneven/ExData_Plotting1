# create plot #4

# file to get data and read the data
dataFileName <- "household_power_consumption.txt"
HPC<-read.table(dataFileName, header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

#select rows for Date = '1/2/2007' and Date = '2/2/2007'
HPC.SubsetDates<-subset(HPC, Date == "1/2/2007"| Date == "2/2/2007")

#combine date and time and format according to assignment
datetime <- strptime(paste(HPC.SubsetDates$Date, HPC.SubsetDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert into numerics
globalActivePower <- as.numeric(HPC.SubsetDates$Global_active_power)
globalReactivePower <- as.numeric(HPC.SubsetDates$Global_reactive_power)
voltage <- as.numeric(HPC.SubsetDates$Voltage)
subMetering1 <- as.numeric(HPC.SubsetDates$Sub_metering_1)
subMetering2 <- as.numeric(HPC.SubsetDates$Sub_metering_2)
subMetering3 <- as.numeric(HPC.SubsetDates$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# 2 plots on row 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# 2 plots on row 2
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering" )
#annotate
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.0, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()