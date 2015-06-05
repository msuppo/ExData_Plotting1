# Plot2: Time series plot of global minute-averaged active power (in kilowatt)


plot2 <- function() {
  
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
  
# plot2
  png("plot2.png", width=480, height=480)
  plot(Data$DataTime, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  cat("Plot2.png has been saved in working directory:", getwd(), "\n", 
      "NOTE: my OS is in Spanish, so the days of Date are in Spanish (Ju. = Thu, Vi. = Fri, Sa. = Sat)")
}
