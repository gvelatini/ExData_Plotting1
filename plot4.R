
setwd("P:/R data/exdata_data_household_power_consumption")

require(dplyr)

d <- tbl_df(read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?","")))             ## read in text file 

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")                                                          ## format the Date columns as dates
ddate <- filter(d, Date == "2007-02-01" | Date =="2007-02-02")                                          ## select the two days of interest
ddate$Time <- as.POSIXct(paste(as.character(ddate$Date),ddate$Time))                                    ## combine date column and time column to get 
## a vector of single date, time character strings
day_range <- as.POSIXct(round(range(ddate$Time), "days"))                                               ## find range of time in days



png("P:/R code/exploring data/plot4.png", width = 480, height = 480)                                    ## Write plot file                             ## draw new x axis with tickmarks at integer # of days                                                                                          ## and tick mark labels Thu, Fri, Sat
    par(mfrow =c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    with(ddate, {
    
        plot(Time, Global_active_power, type = "l", xaxt = "n", xlab = " ", ylab = " Global Active Power")
            axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day"))
    
         plot(Time, Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = " Voltage")
            axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day")) 
        
         plot(Time, Sub_metering_1, type = "l", xaxt = "n", xlab = " ", ylab = "Energy sub metering")
            with(ddate, lines(Time, Sub_metering_2, col = "red"))                                           
            with(ddate, lines(Time, Sub_metering_3, col = "blue"))                                            ## draw same plot to console
            legend("topright", pch = 1, col = c("black", "red", "blue"), 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day"))       
    
        plot(Time, Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = " Global Reactive Power")
            axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day")) 
    })
dev.off()                                                                                                     ## turn off png graphics device

par(mfrow =c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(ddate, {
    
    plot(Time, Global_active_power, type = "l", xaxt = "n", xlab = " ", ylab = " Global Active Power")
    axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day"))
    
    plot(Time, Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = " Voltage")
    axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day")) 
    
    plot(Time, Sub_metering_1, type = "l", xaxt = "n", xlab = " ", ylab = "Energy sub metering")
    with(ddate, lines(Time, Sub_metering_2, col = "red"))                                           
    with(ddate, lines(Time, Sub_metering_3, col = "blue"))                                                   ## draw same plot to console
    legend("topright", pch = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day"))       
    
    plot(Time, Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = " Global Reactive Power")
    axis.POSIXct(1, at = seq(day_range[1], day_range[2], by = "day")) 
})