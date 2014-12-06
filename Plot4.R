##read data from working directory
a<-read.table('household_power_consumption.txt', 
              header = TRUE, 
              sep = ";",
              na.strings = "?",
              strip.white = TRUE)
##subset to get only data for 2/1/2007 and 2/2/2007
b<-a[as.Date(a[,"Date"],"%d/%m/%Y") %in% c(as.Date("02/01/2007","%m/%d/%Y"),
                                           as.Date("02/02/2007","%m/%d/%Y")),
     ]
##Add new column combining date and time
b$datetime<-strptime(paste(b$Date, b$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

##call png device
png("Plot4.png", width = 480, height = 480, units = "px")
##generate plot within png
#create 2x2 canvas
par(mfrow = c(2,2))
#create top left graph
plot(b$datetime,b$Global_active_power,type="l",
     xlab = "",
     ylab = "Global Active Power"     
     )
#create top right graph
plot(b$datetime,b$Voltage,type="l",
     xlab = "datetime",
     ylab = "Voltage"     
)
#create bottom left graph
plot(b$datetime,b$Sub_metering_1,type="n",
     xlab = "",
     ylab = "Energy sub metering"     
)
lines(b$datetime,b$Sub_metering_1,type="l")
lines(b$datetime,b$Sub_metering_2, type = "l", col="red")
lines(b$datetime,b$Sub_metering_3, type = "l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1,1),col=c("black","red","blue"),bty = "n")
#create bottom right graph
plot(b$datetime,b$Global_reactive_power,type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power"     
)
##shut off png device
dev.off()
