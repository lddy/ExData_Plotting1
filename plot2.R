dtf<-read.csv2("household_power_consumption.txt",
               row.names = NULL,
               dec=".",
               stringsAsFactors=FALSE,
               colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
               na.strings="?")

dtfs<-subset(dtf,Date=="1/2/2007"|Date=="2/2/2007")
dtfs$DateTime<-strptime(paste0(dtfs$Date,"-",dtfs$Time),"%d/%m/%Y-%H:%M:%S")
dtfs$Date<-as.Date(dtfs$Date,"%d/%m/%Y")

png(filename="plot2.png")
plot(dtfs$DateTime,dtfs$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
