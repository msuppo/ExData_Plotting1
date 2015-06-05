# Plot1: Histogram of Household Global Active Power (in kilowatt)

plot1 <- function() {

# Data_Preprocesing
  ## Data downloading and extraction
  zipfile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filextracted  <- "household_power_consumption.txt"
  fileLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if (!file.exists(zipfile)) { download.file(fileLocation, zipfile) }
  if (!file.exists(filextracted)) { unzip(zipfile) }
  ## Loading the data, subsetting two required days and setting data variables
  temp <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
  Data <- temp[temp$Date %in% c("1/2/2007","2/2/2007"),]
  ## Create a column 'DateTime' coverting 'Date' and 'Time' into respective Date and Time formats
  Data$DataTime <-strptime(paste(Data$Date, Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
  rm(temp)

  
# plot1
png("plot1.png", width=480, height=480)
hist(Data$Global_active_power, col="red", ylab = "Frequency",  xlab="Global Active Power (kilowatts)", main = paste("Global Active Power"))
dev.off()
cat("Plot1.png has been saved in working directory:", getwd())
}
