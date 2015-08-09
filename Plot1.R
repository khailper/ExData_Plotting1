CreatePlot1 <- function (file){
        ##Reads the needed rows
        data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
        #Add column names (since we skipped the first line)
        colnames(data, do.NULL = FALSE, prefix = "")
        colnames(data) <- c("Date","Time", "Global Active Power (Kilowatts)", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        #reformat data
        data$"Global Active Power (Kilowatts)" <- as.numeric(data$"Global Active Power (Kilowatts)")
        #clean data
        clean <- is.na(data$"Global Active Power (Kilowatts)")
        data$"Global Active Power (Kilowatts)" <- data$"Global Active Power (Kilowatts)"[!clean]
        hist(data$"Global Active Power (Kilowatts)", breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
        dev.copy(png,filename  = "plot1.png")
        dev.off()
}