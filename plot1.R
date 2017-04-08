plot1 <- function() {
  destfile <- 'household_power_consumption.txt'
  header <- read.table(destfile, sep=";", header=FALSE, stringsAsFactors = F, nrows=1)
  data <- read.table(destfile, sep=";", header=TRUE, stringsAsFactors = F, skip=66636, nrows=2880)
  colnames(data) <- header
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data$Time <- strptime(data$Time, format="%H:%M:%S")
  data$Time <- strftime(data$Time, format="%H:%M:%S")
  hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
  dev.copy(png, 'plot1.png')
  dev.off()
}
