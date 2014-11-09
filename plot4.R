plot4<-function() 
{
##read in table
        ExData_Plotting<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

##Below subsets the data to two days 2007-02-01 and 2007-02-02
        ExData_Plotting$Date=as.Date(ExData_Plotting$Date, format="%d/%m/%Y")
        subdata<-ExData_Plotting[(ExData_Plotting$Date=="2007-02-01" | ExData_Plotting$Date=="2007-02-02"),]

##Reformat data
        subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
        subdata$datetime<-paste(subdata$Date, subdata$Time)
        subdata$datetime<-strptime(subdata$datetime, "%Y-%m-%d %H:%M:%S")
        subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
        subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
        subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
        subdata$Global_reactive_power<-as.numeric(as.character(subdata$Global_reactive_power))
##Print plot to screen
        quartz(bg="white")
        par(mfcol=c(2,2))
##Plot1
        plot(subdata[,10], subdata[,3], type="l", ylab="Global Active Power", xlab="")  
##Plot2
plot(subdata$datetime, subdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_2, col="red")
lines(subdata$datetime,subdata$Sub_metering_3, col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), bty="n",col=c("black", "red","blue"))

##Plot3
plot(subdata$datetime,subdata$Voltage, xlab="datetime",ylab="Voltage", type="l")

##Plot4
plot(subdata$datetime, subdata$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

##below saves the plot to png file

##open png graphics device
png(file="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
##Plot1
plot(subdata[,10], subdata[,3], type="l", ylab="Global Active Power", xlab="")  

##Plot2
plot(subdata$datetime, subdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_2, col="red")
lines(subdata$datetime,subdata$Sub_metering_3, col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), bty="n", col=c("black", "red","blue"))

##Plot3
plot(subdata$datetime,subdata$Voltage, xlab="datetime",ylab="Voltage", type="l")

##Plot4
plot(subdata$datetime, subdata$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
}