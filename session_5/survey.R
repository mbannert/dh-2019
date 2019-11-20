library(dplyr)
tibble(
    id = 1:17,
    gender = c("m","w","w","w","w","m","m","m","m","m","m","m","m",
               "w","w","w","m"),
    study = sample(c("Geschichte","Germanistik","English","Geografie"),17,
                   replace = T)
)