

library(dplyr)
library(ggplot)

for (i in 1:50) {
  x <- rnorm(5, 5, 1)
  
  if (i==1) {
    data <- as.data.frame(list(x=x, group=i))
    
    intervalle <- as.data.frame(list(ave = mean(x),
                                     min = mean(x) - 1.96 * (sd(x)/sqrt(length(x))),
                                     max = mean(x) + 1.96 * (sd(x)/sqrt(length(x))),
                                     group = i))
    
  }
  
  else {
    dta <- as.data.frame(list(x=x, group=i))
    interval <- as.data.frame(list(ave = mean(x),
                                   min = mean(x) - 1.96 * (sd(x)/sqrt(length(x))),
                                   max = mean(x) + 1.96 * (sd(x)/sqrt(length(x))),
                                   group = i))
    
    data <- rbind(data, dta)
    intervalle <- rbind(intervalle, interval)
  }
}


intervalle <- intervalle %>% 
  mutate(color = ifelse(min>5, "red",
                        ifelse(max<5, "red", "black")))


ggplot()+
  geom_point(aes(y=data$x, x=0))+
  geom_point(aes(x = intervalle$group, y=intervalle$ave, color = intervalle$color))+
  geom_errorbar(aes(ymin=intervalle$min, ymax=intervalle$max, x = intervalle$group, color = intervalle$color))+
  geom_point(aes(y=mean(data$x), x=51))+
  geom_errorbar(aes(ymin=mean(data$x) - 1.96 * (sd(data$x)/sqrt(length(data$x))),
                    ymax=mean(data$x) + 1.96 * (sd(data$x)/sqrt(length(data$x))),
                    x=51))+
  geom_hline(yintercept = 5)

