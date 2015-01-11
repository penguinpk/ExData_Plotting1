#Import Database
x<-read.table("/users/Punam/Downloads/household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
y<-subset(x,Date=="1/2/2007" | Date=="2/2/2007")
dim(y)  #2880 9
y$Date<-as.Date(y$Date,format="%d%m%y")
class(y$Date) #”Date”

Plot #1 R program
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar=c(4,4,2,2))
hist(y$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (killowatts)")
dev.off()