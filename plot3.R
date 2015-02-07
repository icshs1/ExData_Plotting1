## Read file
original.data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,dec = ".",stringsAsFactors=FALSE,na.strings = "NA")

##Select data beween 2007-02-01 and 2007-02-02 
Dates<-as.Date(original.data$Date,"%d/%m/%Y")
select.data<-original.data[which(Dates=="2007-02-01"|Dates=="2007-02-02"),]

## Change POSIXlt format
Times<-paste(select.data$Date,select.data$Time)
Times1<-strptime(Times,"%d/%m/%Y %H:%M:%S")
## Transform data format from character to number
i=0
for(i in 3:9)
  select.data[,i]<-as.numeric(select.data[,i])
## set local time as UA because here is Korea.
Sys.setlocale("LC_TIME", "English")
                                     

##Plot 
png("plot3.png", width=480, height=580)
plot(Times1,select.data$Sub_metering_1,type="l",ylab="Energy Sub metering",xlab="")
points(Times1,select.data$Sub_metering_2,type="l",col="red")
points(Times1,select.data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))
dev.off()
