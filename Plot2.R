## This code is for the second plot of the first project in the Exploratory Data Analysis


## download the file from the coursera website, unzip and save the text file in your working directory

# Read the data into the variable powerdata

powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors=FALSE, dec=".")

# The following steps should be done to clean the powerdata.  Subset the data for the two dates of interest.  This will be stored in the data_subsets.  
data_subset <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

# check the structure of the subest and create a new column called date_time.  This should be a combination of the Date and Time from the subset data.  
# Also change the class on the global active power column to numeric and store as GAP.  
str(data_subset)


date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data_subset$Global_active_power)


# Create the second plot for the assignment.  The plot should have no title and say Global Active Power (kilowatts) on the Y axis.   

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

plot(date_time, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
