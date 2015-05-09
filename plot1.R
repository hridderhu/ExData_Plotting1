#
# plot1.R
#

setwd("H:\\Datascientist\\04-ExData\\CourseProject1")

energyall <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
energyall <- transform(energyall, Date = as.Date(Date,format="%d/%m/%Y"))

# subset of the days
energy <- subset(energyall, energyall$Date %in% c(as.Date('2007-02-01',format="%Y-%m-%d"), as.Date('2007-02-02',format="%Y-%m-%d")))

# set output device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

hist(energy$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
