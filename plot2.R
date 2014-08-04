
#initializing my working directory
setwd("C:/Users/americo/Documents/Documenti_2_0/Education/Data science/Coursera/exploratory_data_analysis/wdass1")

#reading dataset
df1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

#subsetting the dataframe
df2<-df1[df1$Date=="1/2/2007"|df1$Date=="2/2/2007",]

# converting date and time variables for the future plot
x <- paste(as.character(df2$Date), as.character(df2$Time))
df2$DateTime<-strptime(x, "%d/%m/%Y %H:%M:%S")

#making the plot
#!!!!PLEASE CONSIDER THAT the tick marks labels of x axis are different form professor peng ones because
#the language of the system is setted to italian, my mothertongue (thursday=>giovedì friday=>venerdì saturday=>sabato)!!!
with(df2, plot(DateTime, as.numeric(as.character(Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#saving plot in png extension
dev.copy(png, "plot2.png")
dev.off()