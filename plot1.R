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

#if plot1 already exists, delete it.
plot1name = "plot1.png"
if (file.exists(plot1name)) { 
  file.remove(plot1name)
}
library(datasets)
gap<- as.numeric(as.character(finaldata$Global_active_power))
png(plot1name, width = 480, height = 480)
hist(gap, main = "Global Active Power", col = "red", xlab = "Global Active Power(Kilowatts) by Javier Quintero Ramírez")
dev.off()
