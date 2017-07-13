library(dplyr)
library(jsonlite)

imdb <- readr::read_csv('movie_metadata.csv')
View(imdb)

imdb %>%
  select(director_name, movie_facebook_likes) %>%
  group_by(director_name) %>%
  summarise_all(funs(sum)) %>%
  arrange(desc(movie_facebook_likes))


imdb %>%
  arrange(desc(imdb_score)) %>%
  select(movie_title, imdb_score) %>%
  slice(1:10)


imdb %>%
  select(director_name) %>%
  group_by(director_name) %>%
  count() %>%
  arrange(desc(n))
