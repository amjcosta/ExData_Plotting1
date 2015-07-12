## Read in the data and subset the part we need.
hpc_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dat <- subset(hpc_data, Date == "1/2/2007" | Date == "2/2/2007")

## Open a PNG device.
png(filename="plot2.png", width=480, height=480)

## Format date and time into a new variable.
dat$date_time <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

## Create the line graph and make it look nice.
plot(dat$date_time, as.numeric(levels(dat$Global_active_power))[dat$Global_active_power], 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

## Turn off the PNG device.
dev.off()