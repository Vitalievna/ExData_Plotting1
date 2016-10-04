#Dataset: Electric power consumption. Taken from 
#> file.copy( "C:/Users/iankoudinova/Downloads/exdata%2Fdata%2Fhousehold_power_consumption.zip", getwd())
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
list.files()
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
head(hpc)
sub_hpc <- subset(hpc,subset= Date %in% c("1/2/2007", "2/2/2007"))
head(sub_hpc)
time00<- subset(sub_hpc, subset= Time %in% as.character.POSIXt("00:00:00")& Date %in% "1/2/2007")
##"Thursday"
#Convert Date into Date format
sub_hpc$Date<- as.Date(as.character(sub_hpc$Date),format="%d/%m/%Y" )
## have to concatenate date and time in one column
sub_hpc$DateTime <- as.POSIXct(paste(sub_hpc$Date, sub_hpc$Time), format = "%Y-%m-%d %H:%M:%S")
#set parametrs to defaults
plot.new()
#setting layout of four plots
par(mfcol=c(2,2))
#Plot1
plot( sub_hpc$DateTime, sub_hpc$Global_active_power, ylab="Global Active Power(killowatts)", type = "l", xlab = "")
#plot 2
plot( sub_hpc$DateTime, sub_hpc$Sub_metering_1, ylab="Energy sub metering", type = "l", xlab = "", ylim = range(sub_hpc$Sub_metering_1))
#To draw the plot for next variables on the top. 
par(new=T)
plot( sub_hpc$DateTime, sub_hpc$Sub_metering_2, yaxt = "n", ylim = range(sub_hpc$Sub_metering_1), ylab="Energy sub metering", type = "l", xlab = "", col = "red")
par(new=T)
plot( sub_hpc$DateTime, sub_hpc$Sub_metering_3, yaxt = "n", ylim = range(sub_hpc$Sub_metering_1), ylab="Energy sub metering", type = "l", xlab = "", col = "blue")
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.25, bty = "n")
#plot3
plot(sub_hpc$DateTime, sub_hpc$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
#plot 4
plot(sub_hpc$DateTime, sub_hpc$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.copy(png, file = "plot4.png")
dev.off()

