##read data from working directory
a<-read.table('household_power_consumption.txt', 
              header = TRUE, 
              sep = ";",
              na.strings = "?",
              strip.white = TRUE)
##subset to get only data for 2/1/2007 and 2/2/2007
b<-a[as.Date(a[,"Date"],"%d/%m/%Y") %in% c(as.Date("02/01/2007","%m/%d/%Y"),
                                           as.Date("02/02/2007","%m/%d/%Y")),]
##call png device
png("Plot1.png", width = 480, height = 480, units = "px")
##generate plot within png
hist(b$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"     
     )
##shut off png device
dev.off()
