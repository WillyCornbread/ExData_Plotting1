
# read the data in
column_classes <- c("character","character","double","double","double","double","double","double","numeric")
power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses= column_classes, na.strings="?")

# convert the date column in order to subset only the days I need
power_consumption$Date <- as.POSIXlt(power_consumption$Date ,format="%d/%m/%Y")

# only need 2 days
power_consumption <- power_consumption[power_consumption$Date == as.POSIXlt.date("2007-02-01") | power_consumption$Date == as.POSIXlt.date("2007-02-02"),]

# png it
png(filename="Plot1.png", width=480, height=480, units="px", bg="white")
hist(power_consumption$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()