#read data
gap <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings ="?")

#Subset 
sub_gap <- subset(gap, gap$Date =="1/2/2007"  | gap$Date == "2/2/2007"| is.na(FALSE))

#Variable for x-axis 
plot_varx <- strptime(paste(sub_gap$Date,sub_gap$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Variables plot topleft
plot_gap <- as.numeric(sub_gap$Global_active_power,rm.na=TRUE)

#Variables plot bottomleft
sub_met_1<- as.numeric(sub_gap$Sub_metering_1,rm.na=TRUE)
sub_met_2<- as.numeric(sub_gap$Sub_metering_2,rm.na=TRUE)
sub_met_3<- as.numeric(sub_gap$Sub_metering_3,rm.na=TRUE)

#Variables plot topright
voltage <- as.numeric(sub_gap$Voltage,rm.na=TRUE)

#Variables plot bottomright
grp <- as.numeric(sub_gap$Global_reactive_power,rm.na=TRUE)

#plot

par(mfcol=c(2,2))
#plot topleft
plot(plot_varx,plot_vary, type= "l",xlab= "", ylab = "Global Active Power")

#plot bottomleft
plot(plot_varx,sub_met_1,type = "l",xlab=" ", ylab="Enegry sub metering")
lines(plot_varx,sub_met_2, col="red")
lines(plot_varx, sub_met_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red", "blue"),lty = 1)

#plot topright
plot(plot_varx,voltage, type ="l", xlab="datetime", ylab="Voltage")

#plot bottomleft
plot(plot_varx,grp, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,"plot4.png", width = 480, height =480)
dev.off()
