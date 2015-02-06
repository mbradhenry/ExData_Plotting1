## Exploratory Data Analysis Project 1
## Plot 4

## We assume the data file "household_power_consumption.txt" is located in 
## the R working directory. 

## First create a dataframe 'dataPower' containing the UC Irvine electric power 
## consumption data. We include values of 'header', 'sep', 'na.strings', 
## 'colClasses', and 'nrows' to increase the efficiency of the 'read.table' function.
col <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dataPower <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",
                        colClasses=col,nrows=2075259)

## Subset dataPower to include only entries with date "1/2/2007" or "2/2/2007".
dataPower <- dataPower[dataPower$Date == "1/2/2007" | dataPower$Date == "2/2/2007",]

## Create a new variable 'DateTime' that has type 'POSIXlt' and is the result of 
## concatenating the 'Date' and 'Time'. 
dataPower$DateTime <- paste(dataPower$Date, dataPower$Time, sep=" ")
dataPower$DateTime <- strptime(dataPower$DateTime,format="%d/%m/%Y %H:%M:%S")

## Open a connection to the newly created file 'plot4.png'.
png(file = "plot4.png", width=480, height=480)

## Create the required plot and send the result to 'plot4.png'.
par(mfrow = c(2, 2))
with(dataPower, { 
        plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        
        plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        
        plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="")
        lines(DateTime,Sub_metering_1)
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1), 
               col=c("black","blue","red"),
               bty="n")
        
        plot(DateTime, Global_reactive_power, xlab="datetime",type="l")
})

## Close the connection to 'plot4.png'.
dev.off()
