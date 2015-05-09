#
# plot3.R
#

setwd("H:\\Datascientist\\04-ExData\\CourseProject1")
energyall <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
energyall <- transform(energyall, Date = as.Date(Date,format="%d/%m/%Y"))

# subset of the days
energy <- subset(energyall, energyall$Date %in% c(as.Date('2007-02-01',format="%Y-%m-%d"), as.Date('2007-02-02',format="%Y-%m-%d")))

# make a date Time column
energy <- transform(energy, DateTime = strptime(sprintf("%s %s",as.character(Date),as.character(Time)),"%Y-%m-%d %H:%M:%S"))

# set locale to use Thu, etc. instead of dutch do, etc
Sys.setlocale("LC_TIME", "C")

# set output device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

# plot graph
with(energy, plot(DateTime,Sub_metering_1,type = "l", ylab="Energy sub metering", xlab=" "))
with(energy, lines(DateTime,Sub_metering_2,type = "l", col="red"))
with(energy, lines(DateTime,Sub_metering_3,type = "l", col="blue"))
legend("topright",lty=c(1,1,1) , col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close device
dev.off()
