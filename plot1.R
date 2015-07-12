## Read in the data and subset the part we need.
hpc_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dat <- subset(hpc_data, Date == "1/2/2007" | Date == "2/2/2007")

## Open a PNG device.
png(filename="plot1.png", width=480, height=480)

## Create the histogram and make it look nice.
hist(as.numeric(levels(dat$Global_active_power))[dat$Global_active_power], 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")

## Turn off the PNG device.
dev.off()