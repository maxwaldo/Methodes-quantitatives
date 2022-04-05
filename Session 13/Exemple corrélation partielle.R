library(ggplot2)

#### Exemple correlation partielle

n <- c(1:10)

for (i in n) {
  if(i==1) {
    x1 <- rnorm(20, i, 1)
    
    x2 <- rnorm(20, i/10, 1)
    
    data_part_corr <- as.data.frame(list(x=c(x1, x2),
                                         y=rep(rnorm(20, i, 1), 2),
                                         group = rep(1:2, each=20)))
  } else {
    x1 <- rnorm(20, i, 1)
    
    x2 <- rnorm(20, i * 1.5, 1)
    
    data_part_cor <- as.data.frame(list(x=c(x1, x2),
                                        y=rep(rnorm(20, i, 1), 2),
                                        group = rep(1:2, each=20)))
    
    data_part_corr <- rbind(data_part_corr, data_part_cor)
  }
}


png("scatter plot partial corr.png", width=2000, height=2000, res=300)
ggplot(data_part_corr, aes(x=x, y=y))+
  geom_point()+
  theme_minimal()+
  annotate(geom="text", x=10, y=1, label=paste("r = ", round(cor(data_part_corr$x, data_part_corr$y), 3)))
dev.off()


png("scatter plot partial corr_with corr.png", width=2000, height=2000, res=300)
ggplot(data_part_corr, aes(x=x, y=y, color = factor(group)))+
  geom_point()+
  theme_minimal()+
  annotate(geom="text", x=10, y=1, label=paste("r = ", round(cor(data_part_corr$x, data_part_corr$y), 3)))+
  annotate(geom="text", x=10, y=2, label=paste("r = ", round(cor(data_part_corr[data_part_corr$group==1,]$x, data_part_corr[data_part_corr$group==1,]$y), 3)),
           color = "blue")+
  annotate(geom="text", x=10, y=1.5, label=paste("r = ", round(cor(data_part_corr[data_part_corr$group==2,]$x, data_part_corr[data_part_corr$group==2,]$y), 3)),
           color = "red")+
  scale_color_manual(values = c("blue", "red"))+
  theme(legend.position = "bottom")
dev.off()

library(ppcor)
pcor_exemple <- pcor(as.data.frame(list(x1 = data_part_corr[data_part_corr$group==1,]$x, 
                                        x2 = data_part_corr[data_part_corr$group==2,]$x, 
                                        y = data_part_corr[data_part_corr$group==1,]$y)))

png("scatter plot partial corr_with partial corr.png", width=2000, height=2000, res=300)
ggplot(data_part_corr, aes(x=x, y=y, color = factor(group)))+
  geom_point()+
  theme_minimal()+
  annotate(geom="text", x=12, y=1, label=paste("r = ", round(cor(data_part_corr$x, data_part_corr$y), 3)))+
  annotate(geom="text", x=12, y=2, label=paste("patrial r(x1, y . x2) = ", round(pcor_exemple[["estimate"]][1,3], 3)),
           color = "blue")+
  annotate(geom="text", x=12, y=1.5, label=paste("partial r(x2, y . x1) = ", round(pcor_exemple[["estimate"]][2,3], 3)),
           color = "red")+
  scale_color_manual(values = c("blue", "red"))+
  theme(legend.position = "bottom")
dev.off()

