setwd("C:/Users/Sameer/Desktop")

PC<-read.csv

PC$Date<-as.Date(PC$Date,format="%d/%m/%Y")

df_final_1<-rbind(PC[which(PC$Date == "2007-02-01"),],PC[which(PC$Date == "2007-02-02"),])

df_final_1$Global_active_power<-as.numeric(as.character(df_final_1$Global_active_power))

png(file="C:/Users/Sameer/Desktop/ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")

hist(df_final_1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power" )

dev.off()

