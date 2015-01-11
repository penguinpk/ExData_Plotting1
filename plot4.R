x<-read.table("/users/Punam/Downloads/household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
y<-subset(x,Date=="1/2/2007" | Date=="2/2/2007")
datetime <- strptime(paste(y$Date, y$Time, sep=""), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, y$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, y$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, y$Sub_metering_2, type="l", col="red")
lines(datetime, y$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, y$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()