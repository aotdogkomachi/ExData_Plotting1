# Loading the data
EPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC <- EPC[EPC$Date == "2007-02-01" | EPC$Date == "2007-02-02",]

# Making Plots
# Plot1
hist(EPC[, 3], col = "red", main = "GloGlobal active power", xlab = "Global active power(kilowatts)")