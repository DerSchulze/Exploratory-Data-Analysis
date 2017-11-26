setwd("C:/Users/Alexander Schulze/Dropbox/Weiterbildung/Cousera/Explorative Data Analysis/Week 1")

raw.dat <- read.csv(file = "data/household_power_consumption.txt", sep = ";",header = T,na.strings="?")
dat <- subset(raw.dat,subset = Date=="1/2/2007" |Date== "2/2/2007")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dat$datetime <- with(dat,as.POSIXct(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S"))

# Plot 2
png(filename = "plot2.png",width = 480,height = 480)
plot(dat$Global_active_power~dat$datetime,type="l",ylab="Global Active Power (kilowatts)")
dev.off()