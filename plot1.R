#creating the usable data table
HHdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data<-subset(HHdata,HHdata[[1]]=="1/2/2007" | HHdata[[1]]=="2/2/2007")

#creates plot 1
png("plot1.png")
hist(as.numeric(data[[3]]),freq=T,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")


dev.off()