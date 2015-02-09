library(data.table)
allData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
twoDayData <- as.data.table(allData[allData$Date=="1/2/2007"|allData$Date=="2/2/2007",])
twoDayData[,datetime:= as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),tz="UTC")]  # must use tz and specify valid time zone to make it work
png("plot1.png",width=480,height=480)
hist(twoDayData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()