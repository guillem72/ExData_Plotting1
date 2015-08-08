#function which makes plot1
#params : witdh and height

#it takes a while

make_plot1<-function(ampla=480,llarg=480){
#Read data
power <- read.csv("~/sincron/coursera/r/exploration/week1/household_power_consumption.txt", sep=";", na.strings="?")

#Transform the dates in data to a 'R native' Date format  
dates<-as.Date(power$Date,"%d/%m/%Y")

#Chose the index which we are interested in
index<-which(dates==as.Date("2007-02-01") | dates==as.Date("2007-02-02"))

#Keep only the data with 2007-02-01 and 2007-02-02
power1<-power[index,]
rm(power)
rm(index)




# make the plot PLOT1
png("plot1.png",width = ampla, height = llarg)
hist(power1$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frecuency",main="Global Active Power", col="red")
dev.off()
}