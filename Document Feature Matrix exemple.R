
### Si vous n'avaez pas encore installer les packages, vous pouvez aussi les installer avec les commandes suivantes

#install.packages("quanteda")
#install.packages("quanteda.textplots")

library("quanteda")
library("quanteda.textplots")

## Crée le document feature matrix
DFM_try <- dfm(data_corpus_inaugural)

## Permet de le transformer en base de données
DFM_try <- as.data.frame(DFM_try)

## Permet d'avoir un preview du DFM
View(DFM_try)