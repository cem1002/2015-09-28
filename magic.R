# Quietly load dplyr if not already loaded
suppressMessages(require(dplyr))

random_source_1 <- function(sample_size = 1) {
  return(data_frame(x = rnorm(n = sample_size, mean = 15, sd = 2)))
}

random_source_2 <- function(sample_size = 1) {
  return(data_frame(x = rexp(n = sample_size, rate = 0.5)))
}