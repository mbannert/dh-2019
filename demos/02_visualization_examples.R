# Classic Time Series
library(historydata)
library(tsbox)
library(dygraphs)
dygraph(tsbox::ts_xts(us_national_population))





# Map Example: Walking distances in Zurich
# this want run without an OSRM backend.
# follow my blog to find out more
# ! advanced example, requires basic
# understanding of containerization, docker.
# https://whatsgood.io/post/2019-07-12-favorite-user-take-aways/
library(osrm)
library(leaflet)
library(tidyverse)
# OSRM SERVER
options(osrm.server = "http://127.0.0.1:5000/")

loc <- c(8.54621,47.37779)


iso <- osrmIsochrone(loc, breaks = seq(from = 0, to = 30, by = 5),res=400)


iso@data$run_times <- factor(paste(iso@data$min, "to", iso@data$max, "min"),
                             levels = c("0 to 5 min", "5 to 10 min", "10 to 15 min", "15 to 20 min", "20 to 25 min", "25 to 30 min"))
# Colour palette for each area
factpal <- colorFactor(rev(heat.colors(6)), iso@data$run_times)
leaflet(data = iso) %>%
  setView(lng = 8.54621, lat = 47.37779, zoom = 13) %>%
  addTiles() %>%
  addMarkers(lng = 8.54621, lat = 47.37779, popup = "My Office") %>%
  addPolygons(fill=TRUE, stroke=TRUE, color = "black",
              fillColor = ~factpal(iso@data$run_times),
              weight=0.5, fillOpacity=0.3,
              data = iso, popup = iso@data$run_times,
              group = "Driving Time") %>%
  # Legend
  addLegend("bottomright", pal = factpal, values = iso@data$run_times,   title = "Running Time")
