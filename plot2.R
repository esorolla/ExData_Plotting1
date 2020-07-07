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
GAP <- as.numeric(dF$Global_active_power)

# We create the plot
plot(newTime, GAP, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# We create the png file
dev.copy(png,'plot2.png',width = 480, height = 480, units = "px", pointsize = 12,
         bg = "white")

# We close the png device
dev.off()
