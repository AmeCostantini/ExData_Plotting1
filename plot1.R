

#initializing my working directory
setwd("C:/Users/americo/Documents/Documenti_2_0/Education/Data science/Coursera/exploratory_data_analysis/wdass1")

#reading dataset
df1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

#subsetting the dataframe
df2<-df1[df1$Date=="1/2/2007"|df1$Date=="2/2/2007",]

#making plot 1
with(df2, hist(as.numeric(as.character(Global_active_power)), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red"))

#saving plot in png extension
dev.copy(png, file="plot1.png")
dev.off()