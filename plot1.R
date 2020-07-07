library(dplyr) # We load the library capable to filter data

# We import the data:
file <- "household_power_consumption.txt"
dF <- read.table(file, header=TRUE, sep=";", na='-999')%>%
    filter(Date == "1/2/2007" | Date == "2/2/2007")

# We coerce the data into numeric:
GAP <- as.numeric(dF$Global_active_power)

# We create the histogram
hist(GAP, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# We create the png file
dev.copy(png,'plot1.png',width = 480, height = 480, units = "px", pointsize = 12,
         bg = "white")

# We close the png device
dev.off()
