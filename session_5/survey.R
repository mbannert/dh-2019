library(dplyr)
library(ggplot2)
set.seed(123)
survey <- tibble(
    id = 1:17,
    gender = c("m","w","w","w","w","m","m","m","m","m","m","m","m",
               "w","w","w","m"),
    study = sample(c("Geschichte","Germanistik","English","Geografie"),17,
                   replace = T)
) 


g <- ggplot(survey, aes(x = study,fill = gender))

g + 
    geom_bar() +
    coord_flip()
    facet_wrap(~gender)

