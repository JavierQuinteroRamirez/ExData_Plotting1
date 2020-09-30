#Exploratory Data Analysis - First Course Project
#Javier Quintero Ramírez


#It's mandatory run the plot1.R and plot2.R first !


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