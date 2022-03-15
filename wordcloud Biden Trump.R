
### Exemple adapté de : https://quanteda.io/articles/pkgdown/examples/plotting.html?q=word#wordcloud

### Si vous n'avaez pas encore installer les packages, vous pouvez aussi les installer avec les commandes suivantes

#install.packages("quanteda")
#install.packages("quanteda.textplots")

library("quanteda")
library("quanteda.textplots")


png("wordcloudTrumpBiden.png", width = 2000, height = 2000, res=300)
corpus_subset(data_corpus_inaugural, 
              President %in% c("Biden", "Trump")) %>%
  tokens(remove_punct = TRUE) %>%
  tokens_remove(stopwords("english")) %>%
  dfm() %>%
  dfm_group(groups = President) %>%
  dfm_trim(min_termfreq = 5, verbose = FALSE) %>%
  textplot_wordcloud(comparison = TRUE,
                     color = c('blue', 'red'))
dev.off()



