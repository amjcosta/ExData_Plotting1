## Read in the data and subset the part we need.
hpc_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dat <- subset(hpc_data, Date == "1/2/2007" | Date == "2/2/2007")

## Open a PNG device.
png(filename="plot3.png", width=480, height=480)

## Format date and time into a new variable.
dat$date_time <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

## Create the line graph.
with(dat, plot(date_time, as.numeric(levels(Sub_metering_1))[Sub_metering_1], 
               type="l", 
               xlab="", 
               ylab="Energy sub metering"))
with(dat, lines(date_time, as.numeric(levels(Sub_metering_2))[Sub_metering_2], 
                type="l", 
                col="red"))
with(dat, lines(date_time, as.numeric(Sub_metering_3), 
                type="l", 
                col="blue"))

## Add a legend.
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, 
       col=c("black", "red", "blue"), 
       pch=c(NA, NA, NA))

## Turn off the PNG device.
dev.off()