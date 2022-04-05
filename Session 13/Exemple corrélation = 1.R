library(ggplot2)
### Exemple correlation
data_corr <- as.data.frame(list(x= c(c(1:10)/2, c(1:10), c(1:10)*2),
                                y= rep(c(1:10), 3),
                                group = rep(c(1:3), each=10)))



png("Plot corr = 1.png", width = 2000, height = 2000, res=300)
ggplot(data_corr, aes(x=x, y=y))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~group, ncol=1, nrow = 3)+
  theme_minimal()
dev.off()
