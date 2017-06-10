Power <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrow = 2880)

names <- read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE)
colnames(Power) = colnames(names)

Power$DT <- strptime(paste(Power$Date, Power$Time), format="%d/%m/%Y %H:%M:%S")

win.graph(200,200)

with(Power, plot(DT, Global_active_power, type = "l", ylab ="Global Active Power (kilowatts)" , xlab = ' '))
dev.copy(png,'plot2.png')
dev.off()

