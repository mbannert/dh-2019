# Collection of Historical data
library(historydata)


# Jane Austen Books package
library(janeaustenr)

# The Gutenberg Project
library(gutenbergr)

# Nate Silver's data driven blog
library(fivethirtyeight)


# API wrapper package

library(kofdata)
tsl <- get_time_series("ch.kof.barometer")

tstools::tsplot(tsl)
