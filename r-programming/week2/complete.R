complete <- function(directory, id = 1:332) {
    results <- data.frame()
    for(i in id) {
        filename <- sprintf(file.path(directory, "%03d.csv"), i)
        data <- read.csv(filename)
        results <- rbind(results, c(i, sum(complete.cases(data))))
    }
    colnames(results) <- c("id", "nobs")
    results
}