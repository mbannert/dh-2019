install.packages("datasauRus")

library(ggplot2)
library(datasauRus)
ggplot(datasaurus_dozen, aes(x=x, y=y,
                             colour=dataset))+
    geom_point() +
    theme_void() +
    theme(legend.position = "none")+
    facet_wrap(~dataset, ncol = 3)


# Original idea Anscombe Quartet


library(historydata)
library(tstools)
library(tsbox)
library(dplyr)
tsplot(AirPassengers)

ts_data.frame(AirPassengers) %>% 
    ggplot(aes(x = time,
               y = value)) +
    geom_line() +
    theme_bw()
    
ts_data.frame(historydata::us_national_population) %>% 
    ggplot(aes(x = year,
               y = population)) +
    geom_line() +
    theme_bw()

library(data.table)
library(quanteda)



head(nl)

xx <- bsl %>% 
    count(V8)

p <- ggplot(xx, aes(x = reorder(xx, -n),
                    y = n))

?reorder
    

tips %>% 
    count(day) %>% 
    mutate(perc = n / nrow(tips)) -> tips2

ggplot(tips2, aes(x = day, y = perc)) + geom_bar(stat = "identity")


bsl <- fread("../data/basel_diverse.csv") %>% 
    filter(V8 != "Soldier") 
    
gg <- ggplot(bsl, aes(reorder(V8, -Count), y = Count))

gg + geom_bar() +
    theme_bw() +
    theme(axis.text.x = 
                 element_text(angle = 90, hjust = 1))
    
    

# http://www.sthda.com/english/articles/32-r-graphics-essentials/128-plot-time-series-data-using-ggplot/


# https://towardsdatascience.com/a-comprehensive-guide-to-the-grammar-of-graphics-for-effective-visualization-of-multi-dimensional-1f92b4ed4149

