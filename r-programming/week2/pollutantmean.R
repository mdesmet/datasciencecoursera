pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    filenames <- sprintf(file.path(directory, "%03d.csv"), id)
    
    # shorter but we didn't learn this yet :)
    # data <- do.call("rbind", lapply(filenames, read.csv, header = TRUE))
    
    # but this we learned
    
    aqidata <- data.frame()
    
    for(filename in filenames) {
        aqidata <- rbind(aqidata, read.csv(filename))
    }
    
    mean(aqidata[, pollutant], na.rm = TRUE)
}