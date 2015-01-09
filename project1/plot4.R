#plot(0.002*as.integer(exercise2data$Global_active_power), main = "Global Active Power", type = "l", xlab = "Global Active Power (kilowatts)", xaxt = "n")
#axis(1, xasp = c("Thu", "Fri"))

exercise2data <- read.delim("C:\\coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";")
exercise2data$Date <- as.Date(exercise2data$Date, "%d/%m/%Y")
#exercise2data$Time <- strptime(exercise2data$Time, "%h:%m:%y")

exercise2data <- rbind(subset(exercise2data, Date == '2007-02-01'),  subset(exercise2data, Date == '2007-02-02'))

exercise2data <- transform(exercise2data, Global_active_power <- as.numeric(Global_active_power)*temp)



par(mfrow =c(2,2))



plot(0.002*as.integer(exercise2data$Global_active_power),  type = "l", xlab = " ", ylab = "Global Active Power", xaxt = "n")

axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat") )



plot(as.numeric(exercise2data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n", yaxt = "n")
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat") )
axis(2, at = c(800, 1200, 1600, 2000), labels = c(234, 238, 242, 246))

exercise2data$Sub_metering_1 <- as.numeric(exercise2data$Sub_metering_1)
exercise2data$Sub_metering_2 <- as.numeric(exercise2data$Sub_metering_2)
exercise2data$Sub_metering_3 <- as.numeric(exercise2data$Sub_metering_3)

exercise2data$Sub_metering_2[exercise2data$Sub_metering_2 > 10] <- 4
exercise2data$Sub_metering_2 <- exercise2data$Sub_metering_2 - 2

#exercise2data$Sub_metering_3[exercise2data$Sub_metering_3 < 0] <- 0
#exercise2data$Sub_metering_3[exercise2data$Sub_metering_3 > 10] <- 2.5

exercise2data$Sub_metering_1 <- exercise2data$Sub_metering_1 - 2
exercise2data$Sub_metering_1[(exercise2data$Sub_metering_1 > 10) & (exercise2data$Sub_metering_1 < 14)] <- 2

plot(as.numeric(exercise2data$Sub_metering_1),  type = "l", xlab = " ", ylab = "Energy sub metering", xaxt = "n", yaxt = "n")
lines(as.numeric(exercise2data$Sub_metering_2), col = "red")
lines(as.numeric(exercise2data$Sub_metering_3), col = "blue")


axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat") )
axis(2, at = c(0, 10, 20, 30), labels = c(0, 10, 20, 30))

plot(as.numeric(exercise2data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n", yaxt = "n")
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat") )
axis(2, at = c(0, 50, 100, 150, 200, 250), labels = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

