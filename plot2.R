## Exploratory Data Analysis Project 1
## Plot 2

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

## Open a connection to the newly created file 'plot2.png'.
png(file = "plot2.png", width=480, height=480)

## Create the required plot and send the result to 'plot2.png'.
plot(dataPower$DateTime,dataPower$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Close the connection to 'plot2.png'.
dev.off()
