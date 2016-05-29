#############################################################################
#
#  This script creates plot #2 for Course Project 1
#
#############################################################################

# Read data from Feb-1-2007 to Feb-2-2007
a <- read.table( "household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880, na.strings="?", stringsAsFactors = FALSE )

# Read headers and assign them to column names of the data frame
h <- read.table( "household_power_consumption.txt", header=FALSE, sep=";", nrows=1, stringsAsFactors = FALSE )
colnames( a ) <- unlist( h )

# Create the date/time variable in the correct time format
x <- paste( a[ , 1 ], a[ , 2 ] )
a$Date_Time <- strptime( x, "%d/%m/%Y %H:%M:%S" )

# Open PNG device
png( file = "plot2.png", width = 480, height = 480 )

# Create line plot of global active power
plot( x = a$Date_Time, y = a$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)" )

# CLose PNG device
dev.off()
