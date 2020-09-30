#Exploratory Data Analysis - First Course Project
#Javier Quintero Ramírez


#It's mandatory run the plot1.R and plot2.R first !


#Let's Make the plot!

#if plot3 already exists, delete it.
plot3name = "plot3.png"

if (file.exists(plot3name)) { 
  file.remove(plot3name)
}


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