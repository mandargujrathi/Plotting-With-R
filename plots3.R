Power <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrow = 2880)

names <- read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE)
colnames(Power) = colnames(names)

Power$DT <- strptime(paste(Power$Date, Power$Time), format="%d/%m/%Y %H:%M:%S")

win.graph(200,200)
with(Power, plot(DT, Sub_metering_1, main = " ", type = "n",  ylab ="Energy sub metering" , xlab = ' '))
with(Power, lines(DT, Sub_metering_1, type = "l"))
with(Power, lines(DT, Sub_metering_2, type = "l", col = "red"))
with(Power, lines(DT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lwd = c(1.5,1.5,1.5), col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,'plot3.png')
dev.off()




