# Script for plot1.png
## Global Active Power
## Global Active Power (kilowatts) vs Frequency
################################################

# Set filename to load data
filename <- "./exdata_data_household_power_consumption/"
fullData <- data.table::fread(paste(filename,"household_power_consumption.txt",sep=""), 
                              na.strings="?", data.table=FALSE)

# Extract data for 2007-02-01 to 2007-02-02
fullData$Date <- as.Date(fullData$Date,format="%d/%m/%Y")
data <- subset(fullData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot and save png
png(filename="plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


