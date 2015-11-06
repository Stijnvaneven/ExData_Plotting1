library(dplyr)

#set up getting and cleaning data as a function
#getData <- function(){
#}

# file to get data
dataFileName <- "household_power_consumption.txt"
HPC<-read.table(dataFileName, header = TRUE, sep=";", na.strings = "?")

#HPC$Date<-as.Date(HPC$Date, format="%d/%m/%Y")
#HPC$Time<-strptime(HPC$Time, "%H:%M:%S")

#select rows for Date = '1/2/2007' OR Date = '2/2/2007'
HPC.SubsetDates<-subset(HPC, Date == "2007-02-01"| Date == "2007-02-02")

#plot #2
# this step leads to an empty string. Have not figured out what is wrong.
datetime<-strptime( paste(HPC.SubsetDates$Date, HPC.SubsetDates$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, HPC.SubsetDates$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
