library(dplyr)

# Load the data about household power consumption
dataFileName <- "household_power_consumption.txt"
HPC<-read.table(dataFileName, header = TRUE, sep=";", na.strings = "?")
  
#subset the observations to the range of dates in Jan and Feb 2007
HPC.SubsetDates <- HPC[(HPC$Date=="1/2/2007") | (HPC$Date=="2/2/2007"),]

#Plot 1
png("plot1.png", width=480, height=480)
HPC.SubsetDates$Global_active_power<-as.numeric(HPC.SubsetDates$Global_active_power)
hist(HPC.SubsetDates$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
