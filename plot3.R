dtf<-read.csv2("household_power_consumption.txt",
               row.names = NULL,
               dec=".",
               stringsAsFactors=FALSE,
               colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
               na.strings="?")

dtfs<-subset(dtf,Date=="1/2/2007"|Date=="2/2/2007")
dtfs$DateTime<-strptime(paste0(dtfs$Date,"-",dtfs$Time),"%d/%m/%Y-%H:%M:%S")
dtfs$Date<-as.Date(dtfs$Date,"%d/%m/%Y")

png(filename="plot3.png")

plot(dtfs$DateTime,dtfs$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(dtfs$DateTime,dtfs$Sub_metering_2, type="l", col="red")
lines(dtfs$DateTime,dtfs$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1,col=c("black","red","blue"), legend=c(names(dtfs)[7],names(dtfs)[8],names(dtfs)[9]))


dev.off()
