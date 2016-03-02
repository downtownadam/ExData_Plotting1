require(ggplot2)
require(lubridate)

power <- read.table("C:/users/mila_/documents/Coursera/household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F, na.strings="?")
power$DateTime <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
power<- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

png(file="plot1.png",width=480,height=480)
hist(power$Global_active_power,col="orange",main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()
