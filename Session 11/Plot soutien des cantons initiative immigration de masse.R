## load the libraries
library(RSwissMaps)
library(dplyr)



## Create cantonal template to plot
res_cant_loisMedia <- can.template(2016)

## Impute the values for the variable of interest.

## Here % of support for the mass immigration initiative: https://www.bk.admin.ch/ch/f/pore/va/20140209/can580.html


res_cant_loisMedia$values <-  c(0.473,
                                0.511,
                                0.533,
                                0.582,
                                0.631,
                                0.591,
                                0.588,
                                0.594,
                                0.499,
                                0.485,
                                0.546,
                                0.39,
                                0.506,
                                0.581,
                                0.544,
                                0.635,
                                0.559,
                                0.506,
                                0.552,
                                0.578,
                                0.682,
                                0.389,
                                0.483,
                                0.393,
                                0.391,
                                0.441)


## Recode variable into a discrete one
res_cant_loisMedia <- res_cant_loisMedia %>% 
  mutate(values2 = ifelse(values>0.5, "accept", 
                          ifelse(values<0.5, "reject", NA)))


## Plot the discrete values.
png("plot_massImmigration1.png", width = 2000, height = 2000, res = 300)
can.plot(res_cant_loisMedia$bfs_nr, data = res_cant_loisMedia$values2, 2016, continuous = FALSE, color_discrete = c("qual", "7"), title = "Soutiens pour l'initiative \n sur l'immigration de masse")
dev.off()
## Plot the continuous values. 
png("plot_massImmigration2.png", width = 2000, height = 2000, res = 300)
can.plot(res_cant_loisMedia$bfs_nr, data = res_cant_loisMedia$values * 100, 2016, color_continuous = c("#CC0000", "#009900"), legend_title = "Vote favorable en %", title = "Soutiens pour l'initiative \n sur l'immigration de masse")
dev.off()
