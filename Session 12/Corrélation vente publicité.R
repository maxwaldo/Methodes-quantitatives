### Correlation Sales and advertising
library(ggplot2)


data <- as.data.frame(list(x=c(1:5),
                           y=c(1,1,2,2,4)))


png("Correlation sales adertising.png", width=2000, height=2000, res=300)
ggplot(data = data, aes(x=x, y=y))+
  geom_point()+
  geom_smooth(method = "lm")+
  geom_text(aes(x=4, y=0, label=paste0("r = ", round(cor(x,y), 7))))+
  theme_minimal()
dev.off()


