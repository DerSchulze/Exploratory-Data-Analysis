setwd("C:/Users/Alexander Schulze/Dropbox/Weiterbildung/Cousera/Explorative Data Analysis/Week 1")

raw.dat <- read.csv(file = "data/household_power_consumption.txt", sep = ";",header = T,na.strings="?")
dat <- subset(raw.dat,subset = Date=="1/2/2007" |Date== "2/2/2007")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dat$datetime <- with(dat,as.POSIXct(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S"))

# Plot 3
png(filename = "plot3.png",width = 480,height = 480)
plot(dat$Sub_metering_1~dat$datetime,type="l", ylab="Energy sub metering")
lines(dat$Sub_metering_2~dat$datetime,col="red")
lines(dat$Sub_metering_3~dat$datetime,col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), box.lwd = 1, cex=0.75)
dev.off()