data <- read.table("household_power_consumption.txt",
                   sep=";", na.strings="?",
                   header=T, stringsAsFactors=F)

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

hist(data$Global_active_power,  col="Red",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     main="Global Active Power")

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
