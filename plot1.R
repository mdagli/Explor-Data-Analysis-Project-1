plot1<-function() 
{
##read in table
        ExData_Plotting<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

##Below subsets the data to two days 2007-02-01 and 2007-02-02
        ExData_Plotting$Date=as.Date(ExData_Plotting$Date, format="%d/%m/%Y")
        subdata<-ExData_Plotting[(ExData_Plotting$Date=="2007-02-01" | ExData_Plotting$Date=="2007-02-02"),]
        subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))

##Print plot to screen
quartz(bg="white")
par(mfcol=c(1,1))
hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 

##open png graphics device
png(file="plot1.png", width=480, height=480)

##below saves the plot to png file
        hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  

##Close device
dev.off()
}