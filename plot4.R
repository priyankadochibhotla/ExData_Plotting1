# set working directory
setwd('~/Desktop/ExData_Plotting1')

# open file and read data from specified time frame
file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),
      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
      "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# merge date and time into a single column
data$Datetime <- paste(as.character(data[,1]) , data[,2])

# convert the Date column's datatype from string to date 
data[,1] <- as.Date(data$Date,'%d/%m/%Y')

# create a datetime object 
data$Datetime <- strptime(data$Datetime, '%d/%m/%Y %H:%M')

# convert datatype from text to numbers
data[,3] <- as.numeric(as.character(data[,3])) 

# plot data & save as png
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(data$Datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type='line')
plot(data$Datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type='line')
plot(data$Datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type='line')
lines(data$Datetime, data$Sub_metering_2, col = 'red')
lines(data$Datetime, data$Sub_metering_3, col = 'blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Datetime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_rective_power", type='line')
dev.off()
