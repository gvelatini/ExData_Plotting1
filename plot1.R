
setwd("P:R data/exdata_data_household_power_consumption")

require(dplyr)
d <- tbl_df(read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?","")))                 ## read in text file 

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")                                                              ## format the Date columns as dates
ddate <- filter(d, Date == "2007-02-01" | Date =="2007-02-02")                                              ## select the two days of interest


png("P:/R code/exploring data/plot1.png", width = 480, height = 480)                                      ## Write plot file

hist(ddate$Global_active_power, col = "red", xlim = c(0,6), ylim = c(0,1200), xlab =" Global Active Power (kilowatts)", main = "Global Active Power")
                                                                                                            ## set up hist parameters
dev.off()                                                                                                   ## turn off png graphics device

hist(ddate$Global_active_power, col = "red", xlim = c(0,6), ylim = c(0,1200), xlab =" Global Active Power (kilowatts)", main = "Global Active Power")
                                                                                                            ## plot in plot window