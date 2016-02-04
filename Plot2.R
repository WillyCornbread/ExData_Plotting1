
# read the data in
column_classes <- c("character","character","double","double","double","double","double","double","numeric")
power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses= column_classes, na.strings="?")

# convert the date column in order to subset only the days I need
power_consumption$Date <- as.POSIXlt(power_consumption$Date ,format="%d/%m/%Y")

# only need 2 days
power_consumption <- power_consumption[power_consumption$Date == as.POSIXlt.date("2007-02-01") | power_consumption$Date == as.POSIXlt.date("2007-02-02"),]

# create a datetime to use for this level of detail. Need to go back to string on date to then add the time into it, 
# but it's stil more efficient then converting 2mil rows to only uise 2.8k of them
power_consumption$DateTime <- as.POSIXlt(paste(strftime(power_consumption$Date, format="%d/%m/%Y"), power_consumption$Time) ,format="%d/%m/%Y %H:%M:%S")

# png it
png(filename="Plot2.png", width=480, height=480, units="px", bg="white")
plot(x=power_consumption$DateTime, y=power_consumption$Global_active_power, type="l",xlab="", ylab="Global active Power (kilowatts)")
dev.off()

