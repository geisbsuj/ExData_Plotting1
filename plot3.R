#read data
gap <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings ="?")

#Subset 
sub_gap <- subset(gap, gap$Date =="1/2/2007"  | gap$Date == "2/2/2007"| is.na(FALSE))

#eliminate potential na's(date and time do not have na's)
sub_gap <- sub_gap[!rowSums(is.na(sub_gap[7:8])),]

#Variable for x-axis 
plot_varx <- strptime(paste(sub_gap$Date,sub_gap$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Variables for y-axis
sub_met_1<- as.numeric(sub_gap$Sub_metering_1)
sub_met_2<- as.numeric(sub_gap$Sub_metering_2)
sub_met_3<- as.numeric(sub_gap$Sub_metering_3)

#plot

plot(plot_varx,sub_met_1,type = "l",xlab=" ", ylab="Enegry sub metering")
lines(plot_varx,sub_met_2, col="red")
lines(plot_varx, sub_met_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red", "blue"),lty = 1)
dev.copy(png,"plot3.png", width = 480, height =480)
dev.off()
