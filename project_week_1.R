## Coursera: Explanatory Data Analysis
## Week 1 Project
## Author: Quan Luong

#Plot 1------------

#input data from household power consumption
input <- read.table("project week 1/household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, header = TRUE, dec = ".")
#subset data of dates 1/2/2007 & 2/2/2007
subset.input <- subset(input, Date %in% c("1/2/2007", "2/2/2007"))
# get numeric value of global active power and then plot it
globalActivePower <- as.numeric(subset.input$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

#Plot 2----------

#get date time format of Input's Date and Time
datetime <- strptime(paste(subset.input$Date, subset.input$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()

#Plot 3------------

#get numeric value of sub-metering 1,2,3 and plot them
sub_metering_1 <- as.numeric(subset.input$Sub_metering_1)
sub_metering_2 <- as.numeric(subset.input$Sub_metering_2)
sub_metering_3 <- as.numeric(subset.input$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type = "l", col ="red")
lines(datetime, sub_metering_3, type = "l", col ="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
dev.off()

#Plot 4---------------

#get numeric value of voltage, global reactive power and plot them (along with global active power and sub_metering above)
voltage <- as.numeric(subset.input$Voltage)
globalReactivePower <- as.numeric(subset.input$Global_reactive_power)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type = "l", xlab = "",ylab = "Global Active Power")
plot(datetime, voltage, type = "l", xlab = "datetime",ylab = "Voltage")
plot(datetime, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type = "l", col ="red")
lines(datetime, sub_metering_3, type = "l", col ="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
