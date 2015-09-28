library(rio)
library(ggplot2)
library(dplyr)

leeds <- import("leeds_accidents.csv", setclass = "tbl_df")

leeds %>%  ggplot(aes(x=factor(year), y=casualty_age)) + 
  geom_boxplot() + labs(title="Not very interesting")

