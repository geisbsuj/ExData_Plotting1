#read data
gap <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings ="?")

#Subset 
sub_gap <- subset(gap, gap$Date =="1/2/2007"  | gap$Date == "2/2/2007"| is.na(FALSE))

#eliminate potential na's (date and time do not have na's)
sub_gap <- sub_gap[!rowSums(is.na(sub_gap[3])),]

#Plot Variables 
plot_varx <- strptime(paste(sub_gap$Date,sub_gap$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
plot_vary <- as.numeric(sub_gap$Global_active_power)

#plot

plot(plot_varx,plot_vary, type= "l",xlab= "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width = 480, height =480)
dev.off()
