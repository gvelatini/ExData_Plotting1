
setwd("P:/R data/exdata_data_household_power_consumption")

require(dplyr)

d <- tbl_df(read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?","")))             ## read in text file 

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")                                                          ## format the Date columns as dates
ddate <- filter(d, Date == "2007-02-01" | Date =="2007-02-02")                                          ## select the two days of interest
ddate$Time <- as.POSIXct(paste(as.character(ddate$Date),ddate$Time))                                    ## combine date column and time column to get 
                                                                                                        ## a vector of single date, time character strings
day_range <- as.POSIXct(round(range(ddate$Time), "days"))                                               ## find range of time in days

# png("P:/R code/exploring data/plot2.png", width = 480, height = 480)                                    ## Write plot file
#     plot(ddate$Global_active_power ~ ddate$Time, type = "l", xaxt = "n", xlab = " ", ylab = "Global Active Power (kilowatts)")                                                                                ## set up plot and remove x axis
#     axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day"))                                                   ## draw new x axis with tickmarks at integer # of days                                                                                          ## and tick mark labels Thu, Fri, Sat
# dev.off()                                                                                               ## turn off png graphics device


plot(ddate$Global_active_power ~ ddate$Time, type = "l", xaxt = "n", xlab = " ", ylab = "Global Active Power (kilowatts)")
axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day"))                                       ##  plot in plot window

