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


#Read all data first. 
rawdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#then only get the subset (two single days) that we want.
feb01 <- rawdata[c(rawdata$Date =="1/2/2007"),]
feb02 <- rawdata[c(rawdata$Date =="2/2/2007"),]
finaldata <- rbind(feb01, feb02)


#Let's Make the plot!

#if plot3 already exists, delete it.
plot3name = "plot3.png"

if (file.exists(plot3name)) { 
  file.remove(plot3name)
}

library(datasets)
png(filename = plot3name, width = 480, height = 480)
with(finaldata, {
  plot(Sub_metering_1,type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = "by Javier Quintero Ramírez")
  lines(x=Sub_metering_2, col = "red")
  lines(x=Sub_metering_3, col = "blue")
})
axis(1, at=c(1, as.integer(nrow(finaldata)/2), nrow(finaldata)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()