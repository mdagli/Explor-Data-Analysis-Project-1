plot3<-function() 
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

##Print plot to screen
        quartz(bg="white")
        par(mfcol=c(1,1))
        plot(subdata$datetime, subdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
        lines(subdata$datetime,subdata$Sub_metering_2, col="red")
        lines(subdata$datetime,subdata$Sub_metering_3, col="blue")
        legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
##open png graphics device
        png(file="plot3.png", width=480, height=480)

##below saves the plot to png file
        plot(subdata$datetime, subdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
        lines(subdata$datetime,subdata$Sub_metering_2, col="red")
        lines(subdata$datetime,subdata$Sub_metering_3, col="blue")
        legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))

##Close device
        dev.off()
}