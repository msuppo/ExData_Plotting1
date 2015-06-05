## Plot4: Time series plots of global active power, global reactive power, voltage and sub_metering


plot4 <- function() {

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
  
# Generate plot4  
  png("plot4.png", width=480, height=480)
  ## Split the device in 4 areas
  par(mfrow=c(2,2))
  ##Part 1, 'Global Active Power' vs 'Time' plot
  plot(Data$DataTime, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##Part 2, Time series plot of global minute-averaged active power (in kilowatt)
  plot(Data$DataTime, Data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  ##Part 3, 'Energy sub metering' vs 'Time' plot
  plot(Data$DataTime, Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Data$DataTime, Data$Sub_metering_2,col="red")
  lines(Data$DataTime, Data$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
         lty=1, bty="n") 
  ##Part 4: 'Voltage' vs 'Time' plot
  plot(Data$DataTime, Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  ## Generate png File
  dev.off()
  cat("Plot4.png has been saved in working directory:", getwd())
}
