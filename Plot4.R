## This code is for the fourth plot of the first project in the Exploratory Data Analysis


## download the file from the coursera website, unzip and save the text file in your working directory

# Read the data into the variable powerdata

powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors=FALSE, dec=".")

# The following steps should be done to clean the powerdata.  Subset the data for the two dates of interest.  This will be stored in the data_subsets.  
data_subset <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

# check the structure of the subest and create a new column called date_time.  This should be a combination of the Date and Time from the subset data.  
# Also change the class on the global active power column to numeric and store as GAP.  Create a subset for each of the metered readings and voltage.  Each one should be made numeric.  

date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data_subset$Global_active_power)
GRP <- as.numeric(data_subset$Global_reactive_power)
voltage <- as.numeric(data_subset$Voltage)
SubMeter1 <- as.numeric(data_subset$Sub_metering_1)
SubMeter2 <- as.numeric(data_subset$Sub_metering_2)
SubMeter3 <- as.numeric(data_subset$Sub_metering_3)

# Create the fourth plot for the assignment.  This is a multiplot assignment that needs the mfrow of 2 and 2 to hold the four graphs.
# Graph 1 is a copy of plot 2 from the earlier assignment.
# Graph 2 is a look at voltage and across days and time with datatime on the X and voltage on the Y.  
# Graph 3 is a multi line chart with the sub meters and is a replot of plot 3.  
# Graph 4 is a plot of global reactive power by date and time with datetime on the X and Global Reactive power on the Y.  

png("plot4.png", width=500, height=500)
par(mfrow = c(2, 2)) 

plot(date_time, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, SubMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, SubMeter2, type="l", col="red")
lines(date_time, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()