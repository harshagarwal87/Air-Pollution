pollutantmean <- function(directory,pollutant,id=1:332) {
        Pfiles <- list.files(path=directory, pattern = "*.csv*", full.names = T)
        Pollutiondf <- data.frame()
        for (i in id) {
                if (pollutant == "sulfate") {
                        Pollutiondf <- rbind(Pollutiondf, read.csv(Pfiles[i], colClasses = c(NULL, NA, NULL, NA)))
                        Pmean <- mean(Pollutiondf$sulfate, na.rm = T)
                }       else if (pollutant == "nitrate") {
                        Pollutiondf <- rbind(Pollutiondf, read.csv(Pfiles[i], colClasses = c(NULL, NULL, NA, NA)))
                        Pmean <- mean(Pollutiondf$nitrate, na.rm = T)
                }
        }
        print(Pmean)
}
