setwd("C:/Users/Alexander Schulze/Dropbox/Weiterbildung/Cousera/Explorative Data Analysis/Week 1")

raw.dat <- read.csv(file = "data/household_power_consumption.txt", sep = ";",header = T,na.strings="?")
dat <- subset(raw.dat,subset = Date=="1/2/2007" |Date== "2/2/2007")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dat$datetime <- with(dat,as.POSIXct(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S"))

# Plot 4
png(filename = "plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))
## topleft
plot(dat$Global_active_power ~ dat$datetime, type="l", ylab="Global Active Power", xlab="")

## topright 
plot(dat$Voltage ~ dat$datetime, type="l", ylab="Voltage", xlab="datetime")

## bottomleft
plot(dat$Sub_metering_1~dat$datetime,type="l", ylab="Energy sub metering")
lines(dat$Sub_metering_2~dat$datetime,col="red")
lines(dat$Sub_metering_3~dat$datetime,col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),  cex=0.75,bty = "n")

#bottomrightrechts 
plot(dat$Global_reactive_power ~ dat$datetime, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()