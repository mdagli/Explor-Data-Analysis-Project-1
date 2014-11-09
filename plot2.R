plot2<-function() 
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

##Print plot to screen
        quartz(bg="white")
        par(mfcol=c(1,1))
        plot(subdata[,10], subdata[,3], type="l", ylab="Global Active Power (kilowatts)", xlab="")

##open png graphics device
        png(file="plot2.png", width=480, height=480)

##below saves the plot to png file
        plot(subdata[,10], subdata[,3], type="l", ylab="Global Active Power (kilowatts)", xlab="")
##Close device
        dev.off()
}