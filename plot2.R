library(data.table)
allData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
twoDayData <- as.data.table(allData[allData$Date=="1/2/2007"|allData$Date=="2/2/2007",])
twoDayData[,datetime:= as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),tz="UTC")]  # must use tz and specify valid time zone to make it work
png("plot2.png",width=480,height=480)
with(twoDayData,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()