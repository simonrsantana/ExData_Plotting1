
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

# First plot
png("plot1.png", bg = "white")
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

