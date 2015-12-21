corr <- function (directory, threshold=0) {
        # Setup working directory
        LocalRootDirectory <- "C:/Users/dwtru/Documents/NitratesAndSulfates"
        setwd (LocalRootDirectory)
        fileSet <- list.files(directory, full.names=TRUE)
        idSet <- 1:332
        id <- integer()
        nobs <- integer()
        corList <- numeric()
        for (i in seq_along(idSet)) {
                csvFile <- read.csv(fileSet[idSet[i]])
                hasNA <- 0
                meetsThreshold <- FALSE
                for (j in 1:nrow(csvFile)) {
                        if (is.na(csvFile[j,2])) {
                                hasNA <- hasNA +1
                        } else if (is.na(csvFile[j,3])) {
                                hasNA <- hasNA +1
                        }
                }
                meetsThreshold <- (nrow(csvFile)-hasNA)>threshold
                if (meetsThreshold) {
                        # do the cor() for this file data
                        thisFileCor <- cor(csvFile$sulfate,csvFile$nitrate,
                                         use="complete.obs")
                        # append the cor() result to a numeric vector
                        corList <- c(corList,thisFileCor)
                }
        }
        corList
}