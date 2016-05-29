#############################################################################
#
#  This script creates plot #3 for Course Project 1
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
png( file = "plot3.png", width = 480, height = 480 )

# Create overlaid line plots of energy sub-metering
plot( x = a$Date_Time, y = a$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
lines( a$Date_Time, a$Sub_metering_2, col = "red" )
lines( a$Date_Time, a$Sub_metering_3, col = "blue" )
legend( "topright", lty = c( 1, 1, 1 ), col = c( "black", "red", "blue" ), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

# CLose PNG device
dev.off()
