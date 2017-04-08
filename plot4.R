plot4 <- function() {
  destfile <- 'household_power_consumption.txt'
  header <- read.table(destfile, sep=";", header=FALSE, stringsAsFactors = F, nrows=1)
  data <- read.table(destfile, sep=";", header=TRUE, stringsAsFactors = F, skip=66636, nrows=2880)
  colnames(data) <- header
  data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  par(mfrow = c(2, 2), mar = c(4,4,1,1), oma = c(3,2, 1,0))
  with(data, {
    plot(data$Date, data$Global_active_power, type ="l", xlab="", ylab = "Global Active Power (kilowatts)")
    plot(data$Date, data$Voltage, type ="l", xlab="datetime", ylab = "Voltage")
    
    plot(data$Date, data$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
    points(data$Date, data$Sub_metering_1, type ="l", col="black")
    points(data$Date, data$Sub_metering_2, type ="l", col="red")
    points(data$Date, data$Sub_metering_3, type ="l", col="blue")
    legend("topright", lty = 1, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(data$Date, data$Global_reactive_power, type ="l", xlab="datetime", ylab = "Global_reactive_power")
  })
  dev.copy(png, 'plot4.png')
  dev.off()
}