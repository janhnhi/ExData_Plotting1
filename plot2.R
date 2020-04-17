# Script for plot2.png
## Day vs Global Active Power (kilowatts)
################################################

# Set filename to load data
filename <- "./exdata_data_household_power_consumption/"
fullData <- data.table::fread(paste(filename,"household_power_consumption.txt",sep=""), 
                              na.strings="?", data.table=FALSE)

# Extract data for 2007-02-01 to 2007-02-02
fullData$Date <- as.Date(fullData$Date,format="%d/%m/%Y")
data <- subset(fullData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create DateTime variable to graph
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")

# Plot and save png
png(filename="plot2.png", width=480, height=480, units="px")
plot(data$DateTime, data$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)",
     type="l")
dev.off()