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
Sys.setlocale("LC_TIME", "English")
                                     

##Plot 
png("plot2.png", width=480, height=480)
plot(Times1,select.data$Global_active_power,type="l",ylab="Global active power(kilowatts)",xlab="")
dev.off()
