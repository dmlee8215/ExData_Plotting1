power <- read.csv('household_power_consumption.txt', sep = ';')

# dates in format d/m/y with no zero padding

power <- power[power$Date %in% c('1/2/2007', '2/2/2007'),]

power$datetime <- strptime(paste(power$Date, power$Time), format = '%d/%m/%Y %H:%M:%S')

png('plot3.png')

with(power, plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering'))

with(power, lines(datetime, Sub_metering_2, col = 'red'))

with(power, lines(datetime, Sub_metering_3, col = 'blue'))

legend("topright", paste("Sub_metering", 1:3, sep = '_'), col = c('black', 'red', 'blue'), lty = 1)

dev.off()
