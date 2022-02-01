power <- read.csv('household_power_consumption.txt', sep = ';')

# dates in format d/m/y with no zero padding

power <- power[power$Date %in% c('1/2/2007', '2/2/2007'),]

power$datetime <- strptime(paste(power$Date, power$Time), format = '%d/%m/%Y %H:%M:%S')

png('plot4.png')

par(mfrow = c(2,2))

# first is almost the same as plot 2

with(power, plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power'))

# second is similar but with Voltage, this time not overriding labels

with(power, plot(datetime, Voltage, type = 'l'))

# third is the same as plot 3

with(power, plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering'))

with(power, lines(datetime, Sub_metering_2, col = 'red'))

with(power, lines(datetime, Sub_metering_3, col = 'blue'))

legend("topright", paste("Sub_metering", 1:3, sep = '_'), col = c('black', 'red', 'blue'), lty = 1)

# fourth is similar to the second but with Global_reactive_power

with(power, plot(datetime, Global_reactive_power, type = 'l'))

dev.off()
