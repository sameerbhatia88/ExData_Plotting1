setwd("C:/Users/Sameer/Desktop")

PC<-read.csv("hld_power_con.csv",header=T)

PC$Global_active_power<-as.numeric(as.character(PC$Global_active_power))

PC<-PC[-which(is.na(PC[,3])),]

PC$Time<-as.character(PC$Time)

PC$Date<-as.character(PC$Date)

PC$DateTime<-paste(PC$Date,PC$Time, sep=" ")

PC$DateTime<-strptime(PC$DateTime,format="%d/%m/%Y%H:%M:%S")

PC$Date<-as.Date(PC$Date,format="%d/%m/%Y")

df_final_1<-rbind(PC[which(PC$Date == "2007-02-01"),],PC[which(PC$Date == "2007-02-02"),])

png(file="C:/Users/Sameer/Desktop/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")

plot( df_final_1$DateTime, df_final_1$Global_active_power,type="l",ylab="Global Active Power(kilowatts)" ,xlab="")

dev.off()