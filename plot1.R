#Dataset: Electric power consumption. Taken from 
#> file.copy( "C:/Users/iankoudinova/Downloads/exdata%2Fdata%2Fhousehold_power_consumption.zip", getwd())
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
list.files()
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#head(hpc)
sub_hpc <- subset(hpc,subset= Date %in% c("1/2/2007", "2/2/2007"))
#head(sub_hpc)
# set defaults
dev.off()
hist(sub_hpc$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col= "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
