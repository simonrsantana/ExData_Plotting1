
# If needed, remove the comment from these lines to 
# download and unzip the data used.
#zipname <- "exdata_data_household_power_consumption.zip"
#if (!file.exists(zipname)){
#      fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#      download.file(fileURL, "household_consumption.zip")
#} 
#if (!file.exists("household_power_consumption.txt")) { 
#      unzip("household_consumption.zip") 
#}

# Read the data into a data frame
consumption <- read.table("household_power_consumption.txt", 
                          header = F, sep = ";", 
                          skip = 66637,          # This values selects just the data set we need
                          nrows = 2880)
nam <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
         "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
names(consumption) <- nam
attach(consumption)
completeTime <- strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Fourth plot
png("plot4.png", bg = "white")

par(mfrow=c(2,2))

# 4.1
plot(completeTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# 4.2
plot(completeTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# 4.3
plot(completeTime, Sub_metering_1, type = "l", xlab = "", 
     col = "black", ylab = "Energy sub metering")
lines(completeTime, Sub_metering_2, col = "red")
lines(completeTime, Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

# 4.4
plot(completeTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
