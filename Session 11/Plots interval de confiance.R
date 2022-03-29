#### Plots interval de confiance

## Load libraries
library(ggplot2)

png("Session 11/interval de confiance avec 5 observation.png", width=2000, height = 2000, res=300)
n <- rnorm(5, mean = 5, sd = 1)
mean(n)
sd(n)
ggplot()+
  geom_point(aes(y=n, x=rep("observations", 5)))+
  geom_point(aes(y=mean(n), x="significance 90"))+
  geom_errorbar(aes(ymin = (mean(n)-1.645*sd(n)/sqrt(length(n))), ymax=(mean(n)+1.645*sd(n)/sqrt(length(n))), x="significance 90"), width=0.2)+
  geom_point(aes(y=mean(n), x="significance 95"))+
  geom_errorbar(aes(ymin = (mean(n)-1.96*sd(n)/sqrt(length(n))), ymax=(mean(n)+1.96*sd(n)/sqrt(length(n))), x="significance 95"), width=0.2)+
  geom_point(aes(y=mean(n), x="significance 99"))+
  geom_errorbar(aes(ymin = (mean(n)-2.576*sd(n)/sqrt(length(n))), ymax=(mean(n)+2.576*sd(n)/sqrt(length(n))), x="significance 99"), width=0.2)+
  xlab("")
dev.off()


png("Session 11/interval de confiance avec 50 observations.png", width=2000, height = 2000, res=300)
n <- rnorm(50, mean = 5, sd = 1)
mean(n)
sd(n)
ggplot()+
  geom_point(aes(y=n, x=rep("observations", 50)))+
  geom_point(aes(y=mean(n), x="significance 90"))+
  geom_errorbar(aes(ymin = (mean(n)-1.645*sd(n)/sqrt(length(n))), ymax=(mean(n)+1.645*sd(n)/sqrt(length(n))), x="significance 90"), width=0.2)+
  geom_point(aes(y=mean(n), x="significance 95"))+
  geom_errorbar(aes(ymin = (mean(n)-1.96*sd(n)/sqrt(length(n))), ymax=(mean(n)+1.96*sd(n)/sqrt(length(n))), x="significance 95"), width=0.2)+
  geom_point(aes(y=mean(n), x="significance 99"))+
  geom_errorbar(aes(ymin = (mean(n)-2.576*sd(n)/sqrt(length(n))), ymax=(mean(n)+2.576*sd(n)/sqrt(length(n))), x="significance 99"), width=0.2)+
  xlab("")
dev.off()

png("Session 11/interval de confiance avec 150 observations.png", width=2000, height = 2000, res=300)
n <- rnorm(150, mean = 5, sd = 1)
mean(n)
sd(n)
ggplot()+
  geom_point(aes(y=n, x=rep("observations", 150)))+
  geom_point(aes(y=mean(n), x="significance 90"))+
  geom_errorbar(aes(ymin = (mean(n)-1.645*sd(n)/sqrt(length(n))), ymax=(mean(n)+1.645*sd(n)/sqrt(length(n))), x="significance 90"), width=0.2)+
  geom_point(aes(y=mean(n), x="significance 95"))+
  geom_errorbar(aes(ymin = (mean(n)-1.96*sd(n)/sqrt(length(n))), ymax=(mean(n)+1.96*sd(n)/sqrt(length(n))), x="significance 95"), width=0.2)+
  geom_point(aes(y=mean(n), x="significance 99"))+
  geom_errorbar(aes(ymin = (mean(n)-2.576*sd(n)/sqrt(length(n))), ymax=(mean(n)+2.576*sd(n)/sqrt(length(n))), x="significance 99"), width=0.2)+
  xlab("")
dev.off()




####### Example lois normale intervalle de confiance

png("plot interval de confiance.png", width = 2000, height = 2000, res=300)
n <- rnorm(100000000)

plot(density(n), xlab = "", main = "")

alpha99 <- round(quantile(n, c(0.005, 0.995)), 3)

alpha95 <- round(quantile(n, c(0.025, 0.975)), 3)

alpha90 <- round(quantile(n, c(0.05, 0.95)), 3)

abline(v=alpha99, col = "green")

abline(v=alpha95, col = "blue")

abline(v=alpha90, col = "red")
dev.off()

alpha99
alpha95
alpha90
