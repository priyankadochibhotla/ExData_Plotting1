# set working directory
setwd('~/Desktop/ExData_Plotting1')

# open file and read data from specified time frame
file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),
      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
      "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# plot data & save as png
png('plot1.png', width=480, height=480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()



