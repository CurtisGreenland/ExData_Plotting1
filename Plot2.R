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
png("Plot2.png", width = 480, height = 480, units = "px")
##generate plot within png
plot(b$datetime,b$Global_active_power,type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"     
     )
##shut off png device
dev.off()
