plot2 <- function() {
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       colClasses = c("character", "character", rep("numeric", 7)),
                       na = "?")
    
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png('plot2.png', width = 480, height = 480, units = "px")
    plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    dev.off()
}

plot2()