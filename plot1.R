# note for this first plot, assumes data has been downloaded, unzipped, and txt file has been moved to working directory

power <- read.csv('household_power_consumption.txt', sep = ';')

# dates in format d/m/y with no zero padding

power <- power[power$Date %in% c('1/2/2007', '2/2/2007'),]

gap <- as.numeric(power$Global_active_power)

png('plot1.png')

hist(gap, col = 'red', main = 'Global active power', xlab = 'Global active power (kilowatts)')

dev.off()
