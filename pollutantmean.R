pollutantmean <- function (directory, pollutant, id=1:332) {
        # Setup working directory
        LocalRootDirectory <- "C:/Users/dwtru/Documents/NitratesAndSulfates"
        setwd (LocalRootDirectory)
        fileSet <- list.files(directory, full.names=TRUE)
        myDataFrame <- data.frame()
        for (i in id) {
                myDataFrame <- rbind(myDataFrame, read.csv(fileSet[i]))
        }
        if (pollutant == "sulfate") {
                mean(myDataFrame$sulfate,na.rm=TRUE)
        }
        else if (pollutant == "nitrate") {
                mean(myDataFrame$nitrate,na.rm=TRUE)
        }
}