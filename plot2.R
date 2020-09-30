#Exploratory Data Analysis - First Course Project
#Javier Quintero Ramírez


#It's mandatory run the plot1.R first !


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
