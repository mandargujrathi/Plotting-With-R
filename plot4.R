
Power <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrow = 2880)

names <- read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE)
colnames(Power) = colnames(names)

Power$DT <- strptime(paste(Power$Date, Power$Time), format="%d/%m/%Y %H:%M:%S")

win.graph(200,200)
par(mfrow = c(2,2))
with(Power, plot(DT,  Global_active_power, type = "l", ylab ="Global Active Power (kilowatts)" , xlab = ' '))
with(Power, plot(DT,  Voltage, type = "l", ylab ="Voltage" , xlab = "datetime"))
with(Power, plot(DT,  Sub_metering_1, main = " ", type = "n",  ylab ="Energy sub metering" , xlab = ' '))
with(Power, lines(DT, Sub_metering_1, type = "l"))
with(Power, lines(DT, Sub_metering_2, type = "l", col = "red"))
with(Power, lines(DT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", bty= "n", lwd = c(1.5,1.5,1.5), col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(Power, plot(Power$DT, Power$Global_reactive_power, type = "l", ylab ="Global_reactive_power" , xlab = "datetime"))
dev.copy(png,'plot4.png')
dev.off()


