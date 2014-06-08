#creating the usable data table
HHdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data<-subset(HHdata,HHdata[[1]]=="1/2/2007" | HHdata[[1]]=="2/2/2007")

#creates a vector with the date and time for the x-axis
png("plot2.png")
data$Date[data$Date=="1/2/2007"]="2007-2-1"
data$Date[data$Date=="2/2/2007"]="2007-2-2"
x<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

#creates plot 2
y<-as.numeric(data$Global_active_power)
plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()