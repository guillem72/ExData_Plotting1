#function which makes plot4
#params : witdh and height

#it takes a while

make_plot4<-function(ampla=480,llarg=480){
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
      
      #Creates a new data.frame with a convinient datetime for strptime
      units<-data.frame(matrix(NA,nrow=2880,ncol=1))
      units[,1]<-paste(as.Date(power1[,1],"%d/%m/%Y"),power1[,2])
      
      # make the plot PLOT4
      # xlab show day names in catalan
      png("plot4.png",width = ampla, height = llarg)
      par(mfcol=c(2,2))
      plot(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Global_active_power, type="l", ylab="Global Active Power", xlab=NA)
      
      plot(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
      lines(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Sub_metering_2, type="l",col="red")
      lines(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Sub_metering_3, type="l",col="blue")
      
      plot(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Voltage, type="l", ylab="Voltage", xlab="datetime")
      
      plot(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
      dev.off()
}