library(dplyr)
library(ggplot2)

# Produces a data_frame with normal density values for plotting
norm_dens <- function(mu = 0, sigma = 1) {
  x <- seq(mu - 5*sigma, mu + 5*sigma, 0.1)
  data_frame(x=x, density=dnorm(x, mu, sigma))
}

# Picture of density
ggplot(data = norm_dens(0, 1), aes(x=x, y=density)) + geom_line()

# "The Rule"
pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)
pnorm(3) - pnorm(-3)
