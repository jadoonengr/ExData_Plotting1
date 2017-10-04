# Load Data
setwd("D:/Courses/Data Science/Course 4 - Exploratory Data Analysis/Project 1/")
# Rough idea of required memory is well in range.
# dataset = 2,075,259 rows and 9 columns
# = 2,075,259 × 9 × 8 bytes/numeric
# = 149418648 bytes = 142.5 MB
ener = read.csv2("household_power_consumption.txt",na.strings = "?")
# Select relevant Data
ener$Date <- as.Date(ener$Date,format = "%d/%m/%Y")
ener <- ener[(ener$Date >= as.Date("2007-02-01") & ener$Date <= as.Date("2007-02-02")),]
# Clean Data
ener$DateTime <- strptime(paste(ener$Date,ener$Time), format="%Y-%m-%d %H:%M:%S")
ener$Global_active_power <- as.numeric(levels(ener$Global_active_power))[ener$Global_active_power]
ener$Global_reactive_power <- as.numeric(levels(ener$Global_reactive_power))[ener$Global_reactive_power]
ener$Voltage <- as.numeric(levels(ener$Voltage))[ener$Voltage]
ener$Global_intensity <- as.numeric(levels(ener$Global_intensity))[ener$Global_intensity]
ener$Sub_metering_1 <- as.numeric(levels(ener$Sub_metering_1))[ener$Sub_metering_1]
ener$Sub_metering_2 <- as.numeric(levels(ener$Sub_metering_2))[ener$Sub_metering_2]
ener$Sub_metering_3 <- as.numeric(levels(ener$Sub_metering_3))[ener$Sub_metering_3]

# Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(ener$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
