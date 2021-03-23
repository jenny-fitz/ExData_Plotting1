setwd("C:/Users/Jenny/Documents/R Class/EDA/ExData_Plotting1")

#Step 1 - Read in data with Electric power consumption from UC Irvine.
ElectricPower<-read.table("household_power_consumption.txt",header=TRUE,sep=";")


#Step 2 - Subset the data to only keep rows pertaining to Feb. 1 and 2, 2007.
ElectricPower_200702<-subset(ElectricPower,Date=="1/2/2007"|Date=="2/2/2007")

#Step 3- Name PNG file.
png(file="plot1.png",
       width=480,
       height=480)


#Step 4 - Create histogram.
hist(as.numeric(ElectricPower_200702$Global_active_power),
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")

#Step 5 - Use Dev.off function to create PNG file.
dev.off()

