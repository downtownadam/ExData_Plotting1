require(ggplot2)
require(lubridate)

power <- read.table("C:/users/mila_/documents/Coursera/household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F, na.strings="?")
power$DateTime <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
power<- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#chart 1
plot(x=power$DateTime,y=power$Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="",type="l")
#chart 2
plot(x=power$DateTime,y=power$Voltage,ylab="Voltage",xlab="",type="l")
#chart 3
plot(x=power$DateTime,y=power$Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab="")
lines(x=power$DateTime,y=power$Sub_metering_1)
lines(x=power$DateTime,y=power$Sub_metering_2,col="red")
lines(x=power$DateTime,y=power$Sub_metering_3,col="blue")
legend("topright",6,c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lwd=c(2,2,2),col=c("black","red","blue"))
#chart 4
plot(x=power$DateTime,y=power$Global_reactive_power,ylab="Global Reactive Power",xlab="",type="l")

dev.off()