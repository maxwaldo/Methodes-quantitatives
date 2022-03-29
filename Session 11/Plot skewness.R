#### Plot skewness

## Load library
library(fGarch)

n <- rnorm(1000000)
n_posskew <- rsnorm(n, mean = 0, sd = 1, xi = 1.5)
n_negSkew <- rsnorm(n, mean = 0, sd = 1, xi = -1.5)

png("Session 11/Skewness plot.png", width=2000, height = 2000, res=300)
plot(NULL, ylab = "Density", xlim=c(-7,7), ylim = c(0, 0.5))
lines(density(n), col = "red")
lines(density(n_posskew), col="blue")
lines(density(n_negSkew), col="green")
dev.off()
