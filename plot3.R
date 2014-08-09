plot3 <- function() {
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       colClasses = c("character", "character", rep("numeric", 7)),
                       na = "?")
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png('plot3.png', width = 480, height = 480, units = "px")
    plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright",
           c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"),
           lty = 1, lwd = 1, col = c("black","red","blue"))
    
    dev.off()    
}

plot3()
