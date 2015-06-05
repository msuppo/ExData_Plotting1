## Plot3: Time series plot of energy usage across various sections of the house. All measurements reflect watt-hour of active energy.

plot3 <- function() {
  
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
  
# plot3
  png("plot3.png", width=480, height=480)
  plot(Data$DataTime, Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Data$DataTime,Data$Sub_metering_2,col="red")
  lines(Data$DataTime,Data$Sub_metering_3,col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1, lwd=2.5) 
  dev.off()
  cat("Plot3.png has been saved in working directory:", getwd())
}
