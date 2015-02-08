## This code is for the third plot of the first project in the Exploratory Data Analysis


## download the file from the coursera website, unzip and save the text file in your working directory

# Read the data into the variable powerdata

powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors=FALSE, dec=".")

# The following steps should be done to clean the powerdata.  Subset the data for the two dates of interest.  This will be stored in the data_subsets.  
data_subset <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

# check the structure of the subest and create a new column called date_time.  This should be a combination of the Date and Time from the subset data.  
# Also change the class on the global active power column to numeric and store as GAP.  Create a subset for each of the metered readings and make it numeric.  
str(data_subset)


date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data_subset$Global_active_power)
SubMeter1 <- as.numeric(data_subset$Sub_metering_1)
SubMeter2 <- as.numeric(data_subset$Sub_metering_2)
SubMeter3 <- as.numeric(data_subset$Sub_metering_3)

# Create the third plot for the assignment.  The plot should have no title and say Energy Submetering on the Y axis.  
#Lines for each of the other submeters need to be added to the chart. A legend will be added in the upper right with the values in c().  
#The colors should match the color of the lines.
  

png(filename = "plot3.png", width = 480, height = 480)

par(mar = c(6, 6, 5, 4))

plot(date_time, SubMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, SubMeter2, type="l", col="red")
lines(date_time, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

