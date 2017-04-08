plot2 <- function() {
  destfile <- 'household_power_consumption.txt'
  header <- read.table(destfile, sep=";", header=FALSE, stringsAsFactors = F, nrows=1)
  data <- read.table(destfile, sep=";", header=TRUE, stringsAsFactors = F, skip=66636, nrows=2880)
  colnames(data) <- header
  data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  plot(data$Date, data$Global_active_power, type ="l", xlab="", ylab = "Global Active Power (kilowatts)")
  dev.copy(png, 'plot2.png')
  dev.off()
}
