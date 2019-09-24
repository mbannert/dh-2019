# Julia's Silge examples
# https://www.tidytextmining.com/ngrams.html
# next up could be some tf-idf stuff

library(dplyr)
library(tidytext)
library(janeaustenr)

austen_bigrams <- austen_books() %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2)

austen_bigrams %>%
  count(bigram, sort = TRUE)

bigrams_separated <- austen_bigrams %>%
  separate(bigram, c("word1", "word2"), sep = " ")

bigrams_filtered <- bigrams_separated %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)

# new bigram counts:
bigram_counts <- bigrams_filtered %>%
  count(word1, word2, sort = TRUE)


bigram_counts

bigrams_united <- bigrams_filtered %>%
  unite(bigram, word1, word2, sep = " ")

bigrams_united %>%
  group_by(bigram) %>%
  count(sort = TRUE) %>%
  print(n=50)


# Analyzing bigrams
# term frequency–inverse document frequency
# A high weight in tf–idf is reached by a high term frequency (in the given document) and a low document frequency of the term in the whole collection of documents; the weights hence tend to filter out common terms


bigram_tf_idf <- bigrams_united %>%
  count(book, bigram) %>%
  bind_tf_idf(bigram, book, n) %>%
  arrange(desc(tf_idf))


library(ggplot2)
bigram_tf_idf %>%
  group_by(book) %>%
  top_n(10) %>%
  ungroup() %>%
  ggplot(aes(bigram, tf_idf)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ book, scales = "free_y") +
  coord_flip()




# Ina's Example
# https://programminghistorian.org/en/lessons/basic-text-processing-in-r#fnref:4
