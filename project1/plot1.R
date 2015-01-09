
exercise2data <- read.delim("C:\\coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";")
exercise2data$Date <- as.Date(exercise2data$Date, "%d/%m/%Y")
#exercise2data$Time <- strptime(exercise2data$Time, "%h:%m:%y")

exercise2data <- rbind(subset(exercise2data, Date == '2007-02-01'),  subset(exercise2data, Date == '2007-02-02'))

exercise2data <- transform(exercise2data, Global_active_power <- as.numeric(Global_active_power)*temp)

plot(hist(0.002*as.integer(exercise2data$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red")

