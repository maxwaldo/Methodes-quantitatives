library(ggplot2)
data_class <- as.data.frame(list(x = c(25, 36, 47, 68, 2, 14, 22, 34),
                                 y = rep(c(6, 7, 11, 8), 2),
                                 group = rep(c(1, 2), each=4)))

png("partial corr_hand calculation.png", width=2000, height=2000, res=300)
ggplot(data_class, aes(x=x, y=y, color = factor(group)))+
  geom_point()+
  geom_smooth(method="lm")+facet_wrap(~group)+
  theme_minimal()+
  theme(legend.position = "bottom")
dev.off()

