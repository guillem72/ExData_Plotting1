#function which makes plot3
#params : witdh and height

#it takes a while

make_plot3<-function(ampla=480,llarg=480){
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
      
      # make the plot PLOT3
      # xlab show day names in catalan
      png("plot3.png",width = ampla, height = llarg)
      plot(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
      lines(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Sub_metering_2, type="l",col="red")
      lines(strptime(units[,1],format="%Y-%m-%d %H:%M:%S"),power1$Sub_metering_3, type="l",col="blue")
      legend("topright", legend=names(power1[,7:9]),lty=c(1,1),col=c("black","red","blue"))
      dev.off()
}