#' Search MET
#'
#' This function searches the MET's archive for keywords and
#' returns object ids of search hits. It is a simple wrapper
#' around the MET's Application Programming interface (API).
#' The function is designed to work with other API wrappers
#' and use object ids as an input.
#' @param character search term
#' @return list containing the totoal number of objects found
#' and a vector of object ids.
#'
# Note these declaration are not relevant when code is not
# part of a package, hence you need to call library(jsonlite)
# in order to make this function work if you are not building
# a package.
#' @examples
#' search_met("umbrella")
#' @importFrom jsonlite formJSON
#' @export
search_met <- function(keyword){
  # note how URLencode improves this function
  # because spaces are common in searches
  # but are not allowed in URLs
  url <- sprintf("https://collectionapi.metmuseum.org/public/collection/v1/search?q=%s", URLencode(keyword))
  fromJSON(url)
}

library(jsonlite)

cats <- fromJSON("https://smb.museum-digital.de/json/objects?&s=katze")

cats_2 <- fromJSON("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=101&output=json")
cats_3 <- fromJSON("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=100&startwert=101&output=json")
write.csv(cats, "docs/cats_smb.csv")

cats <- fromJSON("https://smb.museum-digital.de/json/objects?&s=katze")

for (i in cats$total[1]){
  if (cats$total[1] > 100){
    cat_list <- fromJSON("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=100&output=json")
    cat_list <- rbind(cat_list, fromJSON(sprintf("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=%d&startwert=100&output=json", cats$total[1]-100)))
    write.csv(cat_list, "Documents/GitHub/digital_history_intro/docs/cats_full.csv")
  }
  else{
    write.csv(cats, "Documents/GitHub/digital_history_intro/docs/cats_smb.csv")
    }
}

base_URL <- "https://smb.museum-digital.de/json/objects?&s=katze"
cats <- fromJSON(base_URL)
start <-  0
breite <- 10
iterations <- cats$total[1]%/%10 + 1
endsize <- cats$total[1]-(iterations-1) * 10
cat_list <- data.frame()
for (i in 1:iterations){
  if(i < iterations){
    cat_list <- rbind(cat_list, fromJSON(paste(base_URL, "&gbreitenat=10&startwert=", start , sep="")))
  } else {
    cat_list <- rbind(cat_list,fromJSON(paste(base_URL, "&gbreitenat=", 
                                                  endsize, "&startwert=", start, sep="")))
  }
  start <- start + 10
  write.csv(cat_list, "Desktop/cat_list.csv")
}



 
# else{
#    write.csv(cats, "docs/cats_smb.csv")
#}
#}

sprintf("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=%d&startwert=101&output=json", cats$total[1]-100)
cat_list <- fromJSON("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=100&output=json")
cat_list_2 <- fromJSON(sprintf("https://smb.museum-digital.de/?s=&t=listen&extendQuery=katze&gbreitenat=%d&startwert=100&output=json", cats$total[1]-100))
neu <- rbind(cat_list, cat_list_2)


###

library(jsonlite)
library(rjson)
armadillo <- fromJSON("https://catalog.archives.gov/api/v1/?q=armadillo")


