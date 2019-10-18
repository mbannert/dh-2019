library(fivethirtyeight)
library(historydata)

# most important functions to figure out whether
# dataset is what you expected
head(mtcars)
tail(mtcars)
str(mtcars)

# get all available datasets from all
# installed packages
data(package = .packages(all.available = TRUE),)

# a result matrix, turn it into data.frame cause
# it is easier to handle for us
# btw: note where we LINE BREAK the code!!
pkg_data <- as.data.frame(
  data(package = .packages(all.available = TRUE))$results,
  stringsAsFactors = FALSE)

# a warning is NOT an error!
head(pkg_data[,c("Package","Item","Title")])
pkg_data[pkg_data$Package == "historydata",
         c("Package","Item","Title")]

pkg_data[pkg_data$Item == "tudors",
         c("Package","Item","Title")]


# Showcases of lapply ----------------------------
lapply(pkg_data[pkg_data$Package == "historydata","Item"],
       function(x) class(get(x)))

lapply(pkg_data[pkg_data$Package ==
                            "historydata","Item"],
       function(x) str(get(x)))


lapply(pkg_data[pkg_data$Package ==
                  "historydata","Item"],
       function(x) nrow(get(x)))


l <- lapply(pkg_data[pkg_data$Package ==
                  "historydata","Item"],
       function(x) get(x))


names(l) <- pkg_data[pkg_data$Package ==
                       "historydata","Item"]


# is numeric ?
l$early_colleges[,sapply(l$early_colleges, is.numeric)]
# not the most common way to plot it but quite generic...
pairs(l$us_national_population )

pairs(mtcars[,1:3])















