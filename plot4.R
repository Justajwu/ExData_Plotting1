#creating the usable data table
HHdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data<-subset(HHdata,HHdata[[1]]=="1/2/2007" | HHdata[[1]]=="2/2/2007")

#creates a vector with the date and time for the x-axis
data$Date[data$Date=="1/2/2007"]="2007-2-1"
data$Date[data$Date=="2/2/2007"]="2007-2-2"
x<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

#sets up the 4 plot space
png("plot4.png")
par(mfcol=c(2,2))

#Plot Position 1
y<-as.numeric(data$Global_active_power)
plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#Plot Position 2
y1<-as.numeric(data$Sub_metering_1)
y2<-as.numeric(data$Sub_metering_2)
y3<-as.numeric(data$Sub_metering_3)

plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n")

#Plot Position 3
v<-data$Voltage
plot(x,v,type="l",xlab="datetime",ylab="Voltage")

#Plot Position 4
g<-data$Global_reactive_power
plot(x,g,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()