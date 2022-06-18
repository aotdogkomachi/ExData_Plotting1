# Loading the data
EPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC <- EPC[EPC$Date == "2007-02-01" | EPC$Date == "2007-02-02",]

# Making Plots
# Plot1
hist(EPC[, 3], col = "red", main = "GloGlobal active power", xlab = "Global active power(kilowatts)")

# Plot2
EPC_1 <- EPC[EPC$Date == "2007-02-01",]
EPC_2 <- EPC[EPC$Date == "2007-02-02",] 
EPC[1:1440, 2] <- format(EPC[1:1440, 2], "2007-02-01 %H:%M:%S")
EPC[1441:2880, 2] <- format(EPC[1:1440, 2], "2007-02-02 %H:%M:%S")
plot(EPC[, 2], EPC[, 3], type = "l", xlab = "", ylab = "Global active power(kilowatts)")

# Plot3
plot(EPC[, 2], EPC[, 7], , type = "l", xlab = "", ylab = "Energy sub metering")
lines(EPC[, 2], EPC[, 8], col = "red")
lines(EPC[, 2], EPC[, 9], col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot4
par(mfrow = c(2, 2))
plot(EPC[, 2], EPC[, 3], type = "l", xlab = "", ylab = "Global active power(kilowatts)")
plot(EPC[, 2], EPC[, 5], type = "l", xlab = "datetime", ylab = "Voltage")
plot(EPC[, 2], EPC[, 7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(EPC[, 2], EPC[, 8], col = "red")
lines(EPC[, 2], EPC[, 9], col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(EPC[, 2], EPC[, 4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
