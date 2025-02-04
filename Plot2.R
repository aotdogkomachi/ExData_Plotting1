# Loading the data
EPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC <- EPC[EPC$Date == "2007-02-01" | EPC$Date == "2007-02-02",]

# Making Plots
# Plot2
EPC_1 <- EPC[EPC$Date == "2007-02-01",]
EPC_2 <- EPC[EPC$Date == "2007-02-02",] 
EPC[1:1440, 2] <- format(EPC[1:1440, 2], "2007-02-01 %H:%M:%S")
EPC[1441:2880, 2] <- format(EPC[1:1440, 2], "2007-02-02 %H:%M:%S")
plot(EPC[, 2], EPC[, 3], type = "l", xlab = "", ylab = "Global active power(kilowatts)")