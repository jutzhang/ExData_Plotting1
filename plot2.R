#Load File into dataset data
setwd("E:\\Git\\ExData_Plotting1")
readLines("household_power_consumption.txt",3L)
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = T, na.strings="?")
str(data)

#subset data for days 2007-02-01 and 2007-02-02
subdata <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
str(subdata)

#convert Date and Time column to Date class and store it in Date column
subdata$date <- strptime(paste(subdata$Date,subdata$Time,sep = " "), 
                         "%d/%m/%Y %H:%M:%S")

#make plot1
with(subdata, hist(Global_active_power, col="red", breaks=15, 
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",ylim=c(0,1200)))
dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()





