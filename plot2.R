power <- read.csv('household_power_consumption.txt', sep = ';')

# dates in format d/m/y with no zero padding

power <- power[power$Date %in% c('1/2/2007', '2/2/2007'),]

power$datetime <- strptime(paste(power$Date, power$Time), format = '%d/%m/%Y %H:%M:%S')

png('plot2.png')

with(power, plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))

dev.off()
