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

# Plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mar=c(4,4,4,4))
par(mfrow=c(2,2))
plot(ener$DateTime,ener$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(ener$DateTime,ener$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(ener$DateTime, ener$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(ener$DateTime, ener$Sub_metering_2, type="l", col="red")
lines(ener$DateTime, ener$Sub_metering_3, type="l", col="blue")
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black','red','blue'), cex=.75)
plot(ener$DateTime,ener$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()