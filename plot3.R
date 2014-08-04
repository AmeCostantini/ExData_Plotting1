
#initializing my working directory
setwd("C:/Users/americo/Documents/Documenti_2_0/Education/Data science/Coursera/exploratory_data_analysis/wdass1")

#reading dataset
df1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

#subsetting the dataframe
df2<-df1[df1$Date=="1/2/2007"|df1$Date=="2/2/2007",]

# converting date and time variables for the future plot
x <- paste(as.character(df2$Date), as.character(df2$Time))
df2$DateTime<-strptime(x, "%d/%m/%Y %H:%M:%S")

#making the plot - I use the function NEW=TRUE to create multiple plot of differente variable and windows to set only
#one size for all of them
#!!!!PLEASE CONSIDER THAT the tick marks labels of x axis are different form professor peng ones because 
#the language of the system is setted to italian, my mothertongue (thursday=>giovedì friday=>venerdì saturday=>sabato)!!!

windows(width=6, height=8)
with(df2, plot(DateTime, as.numeric(as.character(Sub_metering_1)), ylim=c(0,max(as.numeric(as.character(Sub_metering_1)))), type="l", col="black", ylab="Energy sub metering", xlab=""))
par(new=T)
with(df2, plot(DateTime, as.numeric(as.character(Sub_metering_2)),  ylim=c(0,max(as.numeric(as.character(Sub_metering_1)))), type="l", col="red", ylab="Energy sub metering", xlab=""))
par(new=T)
with(df2, plot(DateTime, as.numeric(as.character(Sub_metering_3)),  ylim=c(0,max(as.numeric(as.character(Sub_metering_1)))), type="l", col="blue", ylab="Energy sub metering", xlab=""))
par(new=T)
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black", "red", "blue"), cex=0.6, adj = c(0, 0))

#saving plot in png extension
dev.copy(png, "plot3.png")
dev.off()