plot4 <- function() {
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       colClasses = c("character", "character", rep("numeric", 7)),
                       na = "?")
    
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png('plot4.png', width = 480, height = 480, units = "px")
    par(mfrow = c(2,2))
    
    plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    
    plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")    
    
    plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright",
           c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"),
           lty = 1, lwd = 1, col = c("black","red","blue"))
    
    plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
    
    dev.off()
}

plot4()