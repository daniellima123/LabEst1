# Pacotes

library(tidyverse)
library(tidytext)

# Leitura dos dados

tweets <- read_csv(file = "Dados/tweets.csv", col_names = T)

tweets_sentimental <- tweets %>% 
  group_by(handle) %>% 
  unnest_tokens("word", "text") %>%
  ungroup() %>% 
  inner_join(get_sentiments("bing")) %>% 
  count(id, handle, sentiment)
tweets_sentimental %>% 
  group_by(handle, sentiment) %>% 
  summarise(n_sum = sum(n)) %>% 
  mutate(n_prop = n_sum/sum(n_sum))
