require(ggplot2)
require(lubridate)

power <- read.table("C:/users/mila_/documents/Coursera/household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F, na.strings="?")
power$DateTime <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
power<- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

png(file="plot2.png",width=480,height=480)
plot(x=power$DateTime,y=power$Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="",type="l")
dev.off()