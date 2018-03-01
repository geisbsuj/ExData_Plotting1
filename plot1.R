#Read Data
gap <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings ="?")

#Subset 
sub_gap <- subset(gap, gap$Date =="1/2/2007"  | gap$Date == "2/2/2007")

#eliminate potential na's(date and time do not have na's)
sub_gap <- sub_gap[!rowSums(is.na(sub_gap[3])),]

#get plot variable
plot_gap <- as.numeric(sub_gap$Global_active_power)
  
#Plot

hist(plot_gap ,col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height =480)
dev.off()