## reading entire dataset
df <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## Date: Date in format dd/mm/yyyy
## So we need to subset the data
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
dt <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(dt)
rm(dt)

## Plot 2
plot(df$Global_active_power~df$Datetime, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

## Saving to file
dev.copy(png, file="~/plot2.png", height=480, width=480)
dev.off()