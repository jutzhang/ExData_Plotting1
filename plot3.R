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

# setting locale to en_US for proper day in a week labels
locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

#make plot3
with(subdata,plot(date,Sub_metering_1,type="l", 
                  xlab = "", ylab="Energy sub metering"))
lines(subdata$date, subdata$Sub_metering_2, col="red")
lines(subdata$date, subdata$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.8)

dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()

# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = locale_original )




