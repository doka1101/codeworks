best <- function (state, outcome){
    setwd("C:/Coursera/Data Science Track/R/A3")
    filename <- "outcome-of-care-measures.csv"
    indx <- 0
    
    data <- read.csv(filename, na.strings = "Not Available")
    data.df <- data.frame(data)
    
    #error checking
    if (nrow(data.df[data$State == state,]) == 0) {
        stop ("invalid state")
    } else if (outcome != "heart attack" && outcome != "heart failure" && 
            outcome != "pneumonia") {
        stop ("invalid outcome")
    } else {
        data.state <- data.df[data.df$State == state, ]
        if (outcome == "heart attack") {
            indx <- 11
        } else if (outcome == "heart failure") {
            indx <- 17
        } else {
            indx <- 23
        }
        data.b <- cbind(data.state[2],data.state[indx])
        gData <- complete.cases(data.b)
        data.b <- data.b[gData,]
        data.b <- data.b[order(data.b[2], data.b[1]), ]
        return (levels(droplevels(data.b[1,1])))
    }
}