Power <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrow = 2880)

names <- read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE)
colnames(Power) = colnames(names)

win.graph(200,200)

hist(Power$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,'plot1.png')
dev.off()
