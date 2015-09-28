library(ggplot2)
library(dplyr)
library(gridExtra) # For multiple plotting

# Make up some data
x <- -100:100/10

noise <- rnorm(length(x), 0, 1)

y_high_positive <- 0 + 1*x + noise
y_low_negative <- 0 - 1*x + 5*noise
y_zero <- 0 + 0*x + noise
y_curved <- -10 + (x^2)/5 + noise

# Put it all in a data_frame
cor_data <- data_frame(x, y_high_positive, y_low_negative, y_zero, y_curved)

# Define a plot and save it as p_high
p_high <- ggplot(cor_data, aes(x=x,y=y_high_positive)) + 
  geom_point() +
  geom_hline(yintercept=0, color="red") +
  geom_vline(xintercept=0, color="red")
  
# The power of ggplot2 here...same plot, different variables!
p_low <- p_high + aes(x=x, y=y_low_negative)
p_zero <- p_high + aes(x=x, y=y_zero)
p_curved <- p_high + aes(y=y_curved)

# Fancy multiple plots
grid.arrange(p_high, p_low, ncol=2)
grid.arrange(p_high, p_low, p_zero, p_curved, ncol=2, nrow=2)

# Calculate the correlations
cor(cor_data)

