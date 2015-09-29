library(rio)
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
 
p_high 
# The power of ggplot2 here...same plot, different variables!
p_low <- p_high + aes(x=x, y=y_low_negative)
p_zero <- p_high + aes(x=x, y=y_zero)
p_curved <- p_high + aes(y=y_curved)

# Fancy multiple plots
grid.arrange(p_high, p_low, p_zero,ncol=3)
grid.arrange(p_high, p_low, p_zero, p_curved, ncol=2, nrow=2)

# Calculate the correlations
options(digits=3)
sim1 <- cor(cor_data)

# ADD LOW CORR EXAMPLE WITH CLEAR RELATIONSHIP
# 
# Added 2015-09-29
# 
# Terminology: "Low" and "High" correlation almost always means "far from 0" 
# either positive or negative. So a correlation of -0.95 would be considered 
# "very highly negatively correlated".
# 
# Also, a low correlation (close to zero) could mean that there is no linear 
# relationship at all, or it could mean that there really is a clear 
# relationship but with lots of random noise. Here is a contrived, simulated example:

# The set.seed function ensures you get the same "random" numbers I do. Change
# the seed to get different ones if you like.
set.seed(2015)
unif_noise <- runif(10000, -3, 3)
x2 <- seq(0, 10, length.out = 10000)
y2 <- 0.02*x2 + unif_noise
d2 <- data_frame(x2, y2)

# There is a clear increasing trend from left to right.
ggplot(d2, aes(x2, y2)) + 
  geom_point() + 
  stat_smooth(method="lm", se = FALSE) +
  theme_gray()

# But the correlation is very small - because of the noise.
cor(d2)

# For those who are familiar with linear regression (we will cover this later)
# here is the analysis to show that the linear relationship really is
# statistically significant.
summary(lm(y2~x2, d2))
