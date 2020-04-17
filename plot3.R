# Script for plot3.png
## Time vs Energy sub metering for 1-3
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
png(filename="plot3.png", width=480, height=480, units="px")
with(data, plot(DateTime, Sub_metering_1,
                xlab="", ylab="Energy sub metering",
                type="l"))
with(data, points(DateTime, Sub_metering_2,
                  type="l", col="red"))
with(data, points(DateTime,Sub_metering_3,
                  type="l", col="blue"))
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=2)

dev.off()