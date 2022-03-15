##### Scrape parliamentary votes
library(dplyr)
library(rvest)



## On prend le lien et on le met dans un variables
url_concillor <- "http://ws-old.parlament.ch/votes/councillors?pageNumber="

## On peut après avoir les elements (nodes) table de la page
data_concillor <- read_html(paste0(url_concillor, 1)) %>% html_table()

## On voit que le resultat donne deux table, e on veut garder que la deuxième
data_concillor <- as.data.frame(data_concillor[[2]])

## Enfin, on crée une autre variable avec les urls des conseillers
urls_concillor <- read_html(paste0(url_concillor, 1)) %>% html_nodes("table") %>% html_nodes("a") %>% html_attr("href")

## Et on joute cette variable à notre base de données en enlevant les urls dont on est pas intéressé.
data_concillor$url <- urls_concillor[11:60]


## Comme il y a 11 page, on peut faire la même chose 10 fois de plus dans un "loop"

for (i in 2:11) { ## Pour chaque élément dans un vecteur de 2  11
  ## On peut après avoir les elements (nodes) table de la page
  dta_concillor <- read_html(paste0(url_concillor, i)) %>% html_table()
  
  ## On voit que le resultat donne deux table, e on veut garder que la deuxième
  dta_concillor <- as.data.frame(dta_concillor[[2]])
  
  ## Enfin, on crée une autre variable avec les urls des conseillers
  uls_concillor <- read_html(paste0(url_concillor, i)) %>% html_nodes("table") %>% html_nodes("a") %>% html_attr("href")
  
  ## Et on joute cette variable à notre base de données en enlevant les urls dont on est pas intéressé.
  dta_concillor$url <- uls_concillor[11:length(uls_concillor)]
  
  data_concillor <- rbind(data_concillor, dta_concillor)
  
  ## On peut ajouter un élément pour savoir ou en est
  
  print(paste0("Get page ", i))
}

for (i in 1:nrow(data_concillor)) {
  
  ### First get the maximum number of page for the vote
  num <- read_html(paste0("http://ws-old.parlament.ch/", data_concillor[i,]$url)) %>% 
    html_nodes("a") %>% 
    html_attr("href")
  
  num <- substr(num[length(num)], 13, nchar(num))
  
  ### For each of these pages, we get the table of votes. In each page there is 50 votes
  for (j in 1:num) {
    if (j == 1 & i ==1) {
      data_votes <- read_html(paste0("http://ws-old.parlament.ch/", data_concillor[i,]$url, "?pageNumber=", j)) %>% 
        html_table()
      data_votes <- as.data.frame(data_votes[[2]])
      
      ### Impute some infos of the politician from the first database
      data_votes$id_concillor <- data_concillor[i,]$Id
      data_votes$fname_concillor <- data_concillor[i,]$`First name`
      data_votes$lname_concillor <- data_concillor[i,]$`Last name`
      
      print(paste0("get info for page ", j, " out of ", num, " for concillor ", i, " out of ", nrow(data_concillor)) )
      
    } else {
      ## For the second and more iteration we do the same and store it in another object
      dta_votes <- read_html(paste0("http://ws-old.parlament.ch/", data_concillor[i,]$url, "?pageNumber=", j)) %>% 
        html_table()
      dta_votes <- as.data.frame(dta_votes[[2]])
      
      
      dta_votes$id_concillor <- data_concillor[i,]$Id
      dta_votes$fname_concillor <- data_concillor[i,]$`First name`
      dta_votes$lname_concillor <- data_concillor[i,]$`Last name`
      
      ## ... and we paste it to the generale database
      data_votes <- rbind(data_votes, dta_votes)
      
      print(paste0("get info for page ", j, " out of ", num, " for concillor ", i, " out of ", nrow(data_concillor)) )
    }
  }
}


