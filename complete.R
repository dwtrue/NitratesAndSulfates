complete <- function (directory, idSet=1:332) {
        # Setup working directory
        LocalRootDirectory <- "C:/Users/dwtru/Documents/NitratesAndSulfates"
        setwd (LocalRootDirectory)
        fileSet <- list.files(directory, full.names=TRUE)
        id <- integer()
        nobs <- integer()
        for (i in seq_along(idSet)) {
                csvFile <- read.csv(fileSet[idSet[i]])
                naCount <-0
                for (j in 1:nrow(csvFile)) {
                        if (is.na(csvFile[j,2])) {
                                naCount <- naCount +1
                        } else if (is.na(csvFile[j,3])) {
                                naCount <- naCount +1
                        }
                }
                id <- c(id,idSet[i])
                nobs <- c(nobs,(nrow(csvFile) - naCount))
        }
        csvOutput <- data.frame(id,nobs)
        csvOutput
}