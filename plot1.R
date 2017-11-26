setwd("C:/Users/Alexander Schulze/Dropbox/Weiterbildung/Cousera/Explorative Data Analysis/Week 1")

raw.dat <- read.csv(file = "data/household_power_consumption.txt", sep = ";",header = T,na.strings="?")
dat <- subset(raw.dat,subset = Date=="1/2/2007" |Date== "2/2/2007")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dat$datetime <- with(dat,as.POSIXct(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S"))

# Plot 1
png(filename = "plot1.png",width = 480,height = 480)
hist(dat$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.off()