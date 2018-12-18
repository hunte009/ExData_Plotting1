## reading entire dataset
df <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## Date: Date in format dd/mm/yyyy
## So we need to subset the data
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Global_active_power: household global minute-averaged active power (in kilowatt)

## Plot 1
hist(as.numeric(df$Global_active_power), 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     col="Red")

## Saving to file
dev.copy(png, file="~/plot1.png", height=480, width=480)
dev.off()