library(ggplot2)
######## Linear regression simple


for (i in 1:20) {
  if(i==1) {
    x <- rnorm(20, i, 1)
    y <- rnorm(20, i, 1)
    
    data_linear <- as.data.frame(list(x=x,
                                      y=y))
  } else {
    x <- rnorm(20, i, 1)
    y <- rnorm(20, i, 1)
    data_lin <- as.data.frame(list(x=x,
                                   y=y))
    
    data_linear <- rbind(data_linear, data_lin)
  }
}

png("linear reg_scatter plot.png", width=2000, height=2000, res=300)
ggplot(data_linear, aes(x=x, y=y))+
  geom_point()+
  theme_minimal()
dev.off()

png("linear ref_with errors.png", width=2000, height=2000, res=300)
ggplot(data_linear, aes(x=x, y=y))+
  geom_point()+
  geom_smooth(method='lm', formula= y~x) +
  geom_segment(aes(x=x, y=y,xend=x, yend=(0.3132 + 0.9758 * x)), size = 0.3, color="green")+
  annotate(geom="text", x=15, y=1, label = "Beta0 = 0.3132")+
  annotate(geom="text", x=15, y=0, label = "Beta1 = 0.9758")+
  theme_minimal()
dev.off()

