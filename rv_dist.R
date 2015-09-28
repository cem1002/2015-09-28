library(dplyr)
library(ggplot2)

source("magic.R")

random_source_1()

# Collect the data
dataset_1 <- random_source_1(sample_size = 50000)

# Plot the data...
ggplot(data = dataset_1, aes(x = x)) + geom_density()
  

# Summarize the data...
dataset_1 %>% summarize_each(funs(mean, sd))

random_source_2()

# Collect the data
dataset_2 <- random_source_2(sample_size = 500)

# Plot the data...
ggplot(data = dataset_2, aes(x)) + geom_density()

# Summarize the data...
dataset_2 %>% summarize_each(funs(mean, sd))




# Kevin Game
sample(c("Head", "Tail"), size = 1)
