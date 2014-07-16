complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    #setting up current working directory.
    setwd("C:/Coursera/Data Science Track/R Programming/A1/")
    
    #initializing average value
    complete_data <- data.frame()
    
    #initializing number of rows
    nobs <- vector()
    
    #vector index
    vIndex <- 1
    
    for (i in seq_along(id)) {
        #filename
        if (id[i] >= 1 && id[i] < 10) {
            filename <- paste(directory,"/00",id[i],".csv",sep="")
        } else if (id[i] >= 10 && id[i] < 100) {
            filename <- paste(directory,"/0",id[i],".csv",sep="")
        } else {
            filename <- paste(directory,"/",id[i],".csv",sep="")    
        }
        data <- read.csv(filename)
        data_good <- complete.cases(data)
        data <- data[data_good,][,]
        
        nobs[vIndex] <- nrow(data)
        vIndex <- vIndex + 1

    }
    complete_data <- data.frame(cbind(id, nobs))
    complete_data
}