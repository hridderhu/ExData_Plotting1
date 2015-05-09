#
# plot2.R
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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

# make graph
with(energy, plot(DateTime,Global_active_power,type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

# close device
dev.off()
