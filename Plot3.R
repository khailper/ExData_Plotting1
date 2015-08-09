CreatePlot3 <- function (file = "household_power_consumption.txt"){
        ##Reads the needed rows
        data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
        #Add column names (since we skipped the first line)
        colnames(data, do.NULL = FALSE, prefix = "")
        colnames(data) <- c("Date","DateTime", "Global Active Power (Kilowatts)", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        #reformat data
        data$"Global Active Power (Kilowatts)" <- as.numeric(data$"Global Active Power (Kilowatts)")
        data$DateTime <- paste(data$Date, data$DateTime)
        data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
        #Plot
        png(filename = "plot3.png")
        plot(data$DateTime, data$"Sub_metering_1", type = "l", xlab = "", ylab = "Energy Sub Metering")
        points(data$DateTime, data$"Sub_metering_2", type = "l", col = "red")
        points(data$DateTime, data$"Sub_metering_3", type = "l", col = "blue")
        #add x-axis and legend
        axis(1, at = c(0, 1440, 2880) ,labels = c("Thu", "Fri", "Sat"), las = 2)
        legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        dev.off()
}