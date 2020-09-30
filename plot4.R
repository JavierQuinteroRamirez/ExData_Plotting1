#Exploratory Data Analysis - First Course Project
#Javier Quintero Ramírez


zipFileName <- "zip_data.zip"

#1 => Download and unzip de origin dataset

#if zip file doesn't exists, download it.
if (!file.exists(zipFileName)){
  zipFileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(zipFileURL, zipFileName, method="curl")
}  

txtFileName <- "household_power_consumption.txt"

#if unziped file doesn't exists, unzip it.
if (!file.exists(txtFileName)) { 
  unzip(zipFileName) 
}

library(datasets)

#Read all data first. 
rawdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#then only get the subset (two single days) that we want.
feb01 <- rawdata[c(rawdata$Date =="1/2/2007"),]
feb02 <- rawdata[c(rawdata$Date =="2/2/2007"),]
finaldata <- rbind(feb01, feb02)


#Let's Make the plot!

#if plot4 already exists, delete it.
plot4name = "plot4.png"

if (file.exists(plot4name)) { 
  file.remove(plot4name)
}


png(filename = plot4name, width = 480, height = 480)

par(mfrow=c(2, 2))

#Global Active Power plot
plot(finaldata$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab="Global Active Power")
axis(1, at = c(1, as.integer(nrow(finaldata)/2), nrow(finaldata)), labels = c("Thu", "Fri", "Sat"))

#Voltage plot
plot(finaldata$Voltage, type="l",xaxt="n",xlab = "Datetime", ylab = "Voltage")
axis(1, at = c(1, as.integer(nrow(finaldata)/2), nrow(finaldata)), labels = c("Thu", "Fri", "Sat"))

#Energy sub metering plot
with(finaldata, {
  plot(Sub_metering_1,type = "l", xaxt = "n", xlab ="", ylab="Energy sub metering")
  lines(x=Sub_metering_2, col = "red")
  lines(x=Sub_metering_3, col = "blue")
})
axis(1, at=c(1, as.integer(nrow(finaldata)/2), nrow(finaldata)), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       box.lwd = 0, box.col = "transparent", bg="transparent")

#Global Reactive Power plot
plot(finaldata$Global_reactive_power, type ="l", xaxt = "n", xlab = "Datetime", ylab = "Global Reactive Power")
axis(1, at = c(1, as.integer(nrow(finaldata)/2), nrow(finaldata)), labels = c("Thu", "Fri", "Sat"))

dev.off()