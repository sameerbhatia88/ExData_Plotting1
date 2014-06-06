setwd("C:/Users/Sameer/Desktop")

PC<-read.csv("hld_power_con.csv",header=T)

PC$Global_active_power<-as.numeric(as.character(PC$Global_active_power))

PC<-PC[-which(is.na(PC[,3])),]

PC$Time<-as.character(PC$Time)

PC$Date<-as.character(PC$Date)

PC$DateTime<-paste(PC$Date,PC$Time, sep=" ")

PC$DateTime<-strptime(PC$DateTime,format="%d/%m/%Y%H:%M:%S")

PC$Date<-as.Date(PC$Date,format="%d/%m/%Y")

PC$Sub_metering_1<- as.numeric(as.character(PC$Sub_metering_1))

PC$Sub_metering_2<- as.numeric(as.character(PC$Sub_metering_2))

PC$Sub_metering_3<- as.numeric(as.character(PC$Sub_metering_3))

df_final_1<-rbind(PC[which(PC$Date == "2007-02-01"),],PC[which(PC$Date == "2007-02-02"),])



png(file="C:/Users/Sameer/Desktop/ExData_Plotting1/figure/plot3.png", width = 480, height = 480, units = "px")


plot( df_final_1$DateTime, df_final_1$Sub_metering_1,type="l",ylab="Energy sub metering" ,xlab="")

lines(df_final_1$DateTime,df_final_1$Sub_metering_2,col="red")

lines(df_final_1$DateTime,df_final_1$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5))

dev.off()