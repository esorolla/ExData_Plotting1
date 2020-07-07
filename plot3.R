library(dplyr) # We load the library capable to filter data
library(lubridate) # We load the library enabling us to
#manipulate dates and times

# We modify the language od the date and time system for the "picky" reviewers
# (the default LC_TIME of my PC is Spanish)
Sys.setlocale("LC_TIME", "English")

# We import the data:
file <- "household_power_consumption.txt"
dF <- read.table(file, header=TRUE, sep=";", na='-999')%>%
    filter(Date == "1/2/2007" | Date == "2/2/2007")

# We concatenate the date and time to convert it into a single object:
newTime <- paste(dF$Date, dF$Time)
newTime <- as.POSIXct(newTime, format = "%d/%m/%Y %H:%M:%S")

# We coerce the data into numeric:
Sub1 <- as.numeric(dF$Sub_metering_1)
Sub2 <- as.numeric(dF$Sub_metering_2)
Sub3 <- as.numeric(dF$Sub_metering_3)

# We create the plot
plot(newTime, Sub1, type = "l", col = "black", xlab = " ", ylab = "Energy sub metering")
lines(newTime, Sub2, col = "red")
lines(newTime, Sub3, col = "blue")

# We add the legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=1.1,
       box.lty=1, box.lwd=1, box.col="black")

# We create the png file
dev.copy(png,'plot3.png',width = 480, height = 480, units = "px", pointsize = 12,
         bg = "white")

# We close the png device
dev.off()
