
###### Différentes distributions normales
## Additional function to get the mode


getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}





## save plot
png("Session 11/Plot dispertion justification.png", width = 2000, height = 2000, res = 300)

## First distribution
n <- rnorm(1000000, 0, 0.5)

## Etendue
Etendu1 <- max(n) - min(n)

## écart interquartile

Interquartile1 <- as.numeric(summary(n)[5] - summary(n)[2])

## Ecart type 

ecartType1 <- sd(n)

## Variance 

Variance1 <- ecartType1^2



## Make plot
plot(NULL, xlim = c(-20, 20), ylim = c(0, 1), xlab = "", ylab = "Density")

## Add line
lines(density(round(n, digits = 3)), col = "blue")

## Add text
text(x=10, y=0.8, labels = paste("Moyenne = ", round(mean(n))))
text(x=10, y=0.7, labels = paste("Médiane = ", round(median(n))))
text(x=10, y=0.6, labels = paste("Mode = ", round(getmode(n))))

## Second distribution
n <- rnorm(1000000)

## Etendue
Etendu2 <- max(n) - min(n)

## écart interquartile

Interquartile2 <- as.numeric(summary(n)[5] - summary(n)[2])

## Ecart type 

ecartType2 <- sd(n)

## Variance 

Variance2 <- ecartType2^2


## Add line
lines(density(round(n, digits = 3)), col = "red")

## Third distribution
n <- rnorm(1000000, 0, 3)

## Etendue
Etendu3 <- max(n) - min(n)

## écart interquartile

Interquartile3 <- as.numeric(summary(n)[5] - summary(n)[2])

## Ecart type 

ecartType3 <- sd(n)

## Variance 

Variance3 <- ecartType3^2

## Add line
lines(density(round(n, digits = 3)), col="green")
dev.off()


### Table dispersion parameters

table_dispersion <- as.data.frame(list(Etendue = c(Etendu1, Etendu2, Etendu3),
                                       Interquartile = c(Interquartile1, Interquartile2, Interquartile3),
                                       EcartType = c(ecartType1, ecartType2, ecartType3),
                                       Variance = c(Variance1, Variance2, Variance3)))

table_dispersion

