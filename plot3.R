data <- read.table("household_power_consumption.txt",
                   sep=";", na.strings="?",
                   header=T, stringsAsFactors=F)

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime <- paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
data$DateTime <- as.POSIXct(data$DateTime)

with(data, {
  plot(Sub_metering_1~DateTime, type="l", 
       xlab="", 
       ylab="Energy sub metering",
       main="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  })

legend("topright", lty=1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
