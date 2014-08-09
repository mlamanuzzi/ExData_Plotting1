plot1 <- function() {
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       colClasses = c("character", "character", rep("numeric", 7)),
                       na = "?")
    
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png('plot1.png', width=480, height=480, units="px")
    hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    
    dev.off()
}

plot1()