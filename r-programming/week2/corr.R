corr <- function(directory, treshold = 0) {
    aqidata <- numeric()
    for(filename in list.files(directory, include.dirs = FALSE)) {
        data <- read.csv(file.path(getwd(), directory, filename))
        ok <- complete.cases(data)
        if(sum(ok) > treshold) {
            aqidata <- c(aqidata, cor(data[ok, ]$nitrate, data[ok, ]$sulfate))
        }
    }
    aqidata
}