
#initializing my working directory
setwd("C:/Users/americo/Documents/Documenti_2_0/Education/Data science/Coursera/exploratory_data_analysis/wdass1")

#reading dataset
df1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

#subsetting the dataframe
df2<-df1[df1$Date=="1/2/2007"|df1$Date=="2/2/2007",]

# converting date and time variables for the future plot
x <- paste(as.character(df2$Date), as.character(df2$Time))
df2$DateTime<-strptime(x, "%d/%m/%Y %H:%M:%S")

#making the plot - I use, for the third plot, the function NEW=TRUE to create multiple plot of differente variable and windows to set only
#one size for all of them
#!!!!PLEASE CONSIDER THAT the tick marks labels of x axis are sometimes different form professor peng ones because 
#the language of the system is setted to italian, my mothertongue (thursday=>giovedì friday=>venerdì saturday=>sabato)!!!

windows(width=10, height=8)
par(mfrow=c(2,2), pty="s", mar=c(4,1.5,5,1) + 0.1)
with(df2, {
  plot(DateTime, as.numeric(as.character(Global_active_power)), type="l", ylab="Global Active Power", xlab="")
  plot(DateTime, as.numeric(as.character(Voltage)), type="l", ylab="Voltage", xlab="datetime")  
  plot(DateTime, as.numeric(as.character(Sub_metering_1)), ylim=c(0,max(as.numeric(as.character(Sub_metering_1)))), type="l", col="black", ylab="Energy sub metering", xlab="")
  par(new=T)
  plot(DateTime, as.numeric(as.character(Sub_metering_2)),  ylim=c(0,max(as.numeric(as.character(Sub_metering_1)))), type="l", col="red", ylab="Energy sub metering", xlab="")
  par(new=T)
  plot(DateTime, as.numeric(as.character(Sub_metering_3)),  ylim=c(0,max(as.numeric(as.character(Sub_metering_1)))), type="l", col="blue", ylab="Energy sub metering", xlab="")
  par(new=T)
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), box.col = "transparent", bty='n', cex=0.5)
  par(new=F)
  plot(DateTime, as.numeric(as.character(Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")  
  
})

#saving plot in png extension
dev.copy(png, "plot4.png")
dev.off()