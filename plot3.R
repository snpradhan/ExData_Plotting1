plot3 <- function() {
  destfile <- 'household_power_consumption.txt'
  header <- read.table(destfile, sep=";", header=FALSE, stringsAsFactors = F, nrows=1)
  data <- read.table(destfile, sep=";", header=TRUE, stringsAsFactors = F, skip=66636, nrows=2880)
  colnames(data) <- header
  data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  plot(data$Date, data$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
  points(data$Date, data$Sub_metering_1, type ="l", col="black")
  points(data$Date, data$Sub_metering_2, type ="l", col="red")
  points(data$Date, data$Sub_metering_3, type ="l", col="blue")
  legend("topright", lty = 1, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.copy(png, 'plot3.png')
  dev.off()
}
