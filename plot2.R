data <- read.table("household_power_consumption.txt",
                   sep=";", na.strings="?",
                   header=T, stringsAsFactors=F)

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime <- paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
data$DateTime <- as.POSIXct(data$DateTime)

plot(data$Global_active_power~data$DateTime, type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)",
     main=""
     )

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
