install.packages("datasauRus")

library(ggplot2)
library(datasauRus)
library(viridis)
library(dplyr)

autoplot(datasaurus_dozen)

plot(datasaurus_dozen_wide$dino_x,
     datasaurus_dozen_wide$dino_y)

datasaurus_dozen %>% 
    filter(dataset %in% c("dino",
                          "wide_lines",
                          "away")) %>% 
    ggplot(
       aes(x = x,
           y = y,
           color = dataset)) +
    geom_point() +
    theme_void() +
    theme(legend.position = "none") +
    scale_colour_viridis_d() +
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

library(leaflet)
loc <- data.table::fread("data/orte.csv")

m <- leaflet(data = loc[1:20,]) %>% 
    addTiles() %>% 
    addMarkers(~lng,~lat)
    
library(geojsonio)
fso <- geojsonio::geojson_read("data/ch_fso_simple.geojson", what = "sp")

class(fso@data)

us <- geojson_read("data/gz_2010_us_040_00_500k.json",
                   what = "sp")
pal <- colorNumeric("viridis", NULL)

leaflet(us) %>%
    addTiles() %>%
    addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                fillColor = ~pal(log10(pop)),
                ) %>%
    addLegend(pal = pal, values = ~log10(pop), opacity = 1.0,
              labFormat = labelFormat(transform = function(x) round(10^x)))


library(dplyr)
library(leaflet)
fso_pop <- tibble(GRNR = 1:7,
       POP = c(1593839,1842251,1128723,
               1466424,1153485,790458,351946))

fso@data <- merge(fso@data,fso_pop)
pal <- colorNumeric("viridis", NULL)
leaflet(fso) %>%
    addTiles() %>%
    addPolygons(stroke = FALSE,
                smoothFactor = 0.3, fillOpacity = .6,
                fillColor = ~pal(log10(POP)),
    ) %>% 
    addLegend(pal = pal,
              title = "Population",
              values = ~log10(POP), opacity = 1.0,
              labFormat = labelFormat(transform = function(x) round(10^x)))



leaflet(nycounties) %>%
    addTiles() %>%
    addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                fillColor = ~pal(log10(pop)),
                label = ~paste0(county, ": ", formatC(pop, big.mark = ","))) %>%
    addLegend(pal = pal, values = ~log10(pop), opacity = 1.0,
              labFormat = labelFormat(transform = function(x) round(10^x)))

set.seed(123)
students <- tibble(id = 1:20,
        gender = sample(c("M","F"),20, replace = T),
        main_study = sample(c("history","politics",
                              "sociology"), 20,
                            replace = T)
        )

library(ggplot2)
library(viridis)
students$main_study
gg <- ggplot(students, aes(main_study,
                           fill = gender))
gg + 
    geom_bar()+
    scale_fill_manual(values = viridis(2))
    facet_wrap(~gender)+






# https://www.bfs.admin.ch/bfs/de/home/statistiken/querschnittsthemen/raeumliche-analysen/raeumliche-gliederungen/analyseregionen.html


# Spatial stuff
# https://geocompr.robinlovelace.net/adv-map.html


# thematic maps might be interesting
# https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html

# gis stack exchange
# shape date : https://gadm.org/

# might want to go for swiss map 
# https://cran.r-project.org/web/packages/geojsonio/index.html






# http://www.sthda.com/english/articles/32-r-graphics-essentials/128-plot-time-series-data-using-ggplot/


# https://towardsdatascience.com/a-comprehensive-guide-to-the-grammar-of-graphics-for-effective-visualization-of-multi-dimensional-1f92b4ed4149

