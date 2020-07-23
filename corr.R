corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        source("complete.R")
        
        Pollutiondf <- data.frame()   
        CompleteCases <- data.frame()
        CorrVector <- numeric(0)
        
        Pfiles <- list.files(path="specdata", pattern = "*.csv*", full.names = T)
        AllComplete <- complete("specdata")
        AboveThresh <- AllComplete[AllComplete$nobs > threshold, 1]
        
        y <- 1
        for (i in AboveThresh) {
                Pollutiondf <- read.csv(Pfiles[i])
                CompleteCases <- Pollutiondf[complete.cases(Pollutiondf),]
                NitrateData <- CompleteCases$nitrate
                SulfateData <- CompleteCases$sulfate
                CorrVector[y] <- cor(NitrateData, SulfateData)
                y <- y + 1
        }
        CorrVector
}