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

#if plot2 already exists, delete it.
plot2name = "plot2.png"

if (file.exists(plot2name)) { 
  file.remove(plot2name)
}

library(datasets)
finaldata$DateTime <- as.POSIXct(strptime(paste(finaldata$Date,finaldata$Time), "%d/%m/%Y %H:%M:%S"))
x <- finaldata$DateTime
y<- as.numeric(as.character(finaldata$Global_active_power))

png(plot2name, width = 480, height = 480)
with(finaldata, plot(x, y, type = "l", ylab = "Global Active Power(Kilowatts)", xlab = "by Javier Quintero Ramírez"))
dev.off()
