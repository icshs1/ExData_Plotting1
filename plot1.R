## Read file from origina data
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
## set local time as UA because here is Korea..
Sys.setlocale("LC_TIME", "English")
                                     

##Plot Histogram
png("plot1.png", width=480, height=580)
hist(select.data$Global_active_power,col="red",main="Global Active Power",xlab="Global active power(kilowatts)")
dev.off()
