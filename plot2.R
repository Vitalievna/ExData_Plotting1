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
#plot DateTime vs Global active Power. Had to explicitly type xlab = "" to get rid of xlab by default.
plot.new()
plot(sub_hpc$DateTime, sub_hpc$Global_active_power, ylab="Global Active Power(killowatts)", type = "l", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()
