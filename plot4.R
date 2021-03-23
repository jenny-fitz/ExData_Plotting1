setwd("C:/Users/Jenny/Documents/R Class/EDA/ExData_Plotting1")

#Step 1 - Read in data with Electric power consumption from UC Irvine.
ElectricPower<-read.table("household_power_consumption.txt",header=TRUE,sep=";")


#Step 2 - Subset the data to only keep rows pertaining to Feb. 1 and 2, 2007.
ElectricPower_200702<-subset(ElectricPower,Date=="1/2/2007"|Date=="2/2/2007")
ElectricPower_200702$date_and_time=strptime(paste(ElectricPower_200702$Date,ElectricPower_200702$Time,sep=" "),"%d/%m/%Y %H:%M:%S")


#Step 3- Name PNG file.
png(file="plot4.png",
       width=480,
       height=480)


#Step 4 - Create line graph with sub-metering and legend.

par(mfrow=c(2,2))
#Plot 1
plot(ElectricPower_200702$date_and_time,
     as.numeric(ElectricPower_200702$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

#Plot2
plot(ElectricPower_200702$date_and_time,
     as.numeric(ElectricPower_200702$Voltage),
     type="l",
     xlab="datetime",
     ylab="Voltage")

#Plot 3
plot(ElectricPower_200702$date_and_time,
     as.numeric(ElectricPower_200702$Sub_metering_1),
    type="l",
    xlab="",
    ylab="Energy sub metering",
    main="Plot3")
lines(ElectricPower_200702$date_and_time,
     as.numeric(ElectricPower_200702$Sub_metering_2),
     type="l",
     col="red")
lines(ElectricPower_200702$date_and_time,
      as.numeric(ElectricPower_200702$Sub_metering_3),
      type="l",
      col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lwd=1)

#Plot 4
plot(ElectricPower_200702$date_and_time,
     as.numeric(ElectricPower_200702$Global_reactive_power),
     type="l",
     xlab="datetime",
     ylab="Global_Reactive_power")


#Step 5 - Use Dev.off function to create PNG file.
dev.off()

