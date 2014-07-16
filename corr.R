corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    #setting up current working directory.
    setwd("C:/Coursera/Data Science Track/R Programming/A1/")
    
    source("complete.R")
    data.all <- complete("specdata")
    
    #correlation vector
    cVector <- vector()
    
    #vector index
    vIndex <- 1
    
    isMet <- F
    
    for (m in seq_along(myfiles)){
        filename <- paste(directory,"/",myfiles[m], sep="")
        data <- read.csv(filename)
        data_good <- complete.cases(data)
        data.complete <- data[data_good,][,]
        
        if (nrow(data.complete) > threshold) {
            
            cVector[vIndex] <- cor(data.complete[,3], data.complete[,2])
            vIndex <- vIndex + 1
            isMet <- T
        }
        
        if (isMet == F) {
            vIndex <- 0
        }
    }
    vIndex
}