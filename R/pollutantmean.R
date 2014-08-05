pollutantmean <- function(directory, pollutant, id = 1:332) {

    #setting up current working directory.
    setwd("C:/Coursera/Data Science Track/R Programming/A1/")
    
    #initializing average value
    all_data <- data.frame()
    
    for (i in seq_along(id)) {
        #filename
        if (id[i] >= 1 && id[i] < 10) {
            filename <- paste(directory,"/00",id[i],".csv",sep="")
        } else if (id[i] >= 10 && id[i] < 100) {
            filename <- paste(directory,"/0",id[i],".csv",sep="")
        } else {
            filename <- paste(directory,"/",id[i],".csv",sep="")    
        }
        all_data <- rbind(all_data, read.csv(filename))
    }
    
    #output mean
    format(mean(all_data[,pollutant], na.rm = T), digits = 4)
}