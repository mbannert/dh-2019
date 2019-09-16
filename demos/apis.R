# Get umbrellas from the MET ?
library(jsonlite)

# Write a custom function
# to keep everything private, avoid global objects !
download_images_by_id <- function(ids,
                                  download = "primaryImage"){

  obj_list <- lapply(ids, function(x){
    req <- sprintf("https://collectionapi.metmuseum.org/public/collection/v1/objects/%s", x)
    fromJSON(req)
  })

  img_urls <- lapply(obj_list, "[[", download)
  lapply(seq_along(img_urls), function(x){
    download.file(img_urls[[x]],
                  destfile = sprintf("data/%d.jpg", x)
    )})

    }


umbrella <- fromJSON("https://collectionapi.metmuseum.org/public/collection/v1/search?q=umbrella")


download_images_by_id(umbrella$objectIDs[1:5])


# A few notes from the MET API documentation

# https://metmuseum.github.io/

# from the site:
# "The Metropolitan Museum of Art presents over 5,000 years of art from around the world for everyone to experience and enjoy. The Museum lives in three iconic sites in New York City—The Met Fifth Avenue, The Met Breuer, and The Met Cloisters. Millions of people also take part in The Met experience online."

# all Objects
# https://collectionapi.metmuseum.org/public/collection/v1/objects
# by department
# https://collectionapi.metmuseum.org/public/collection/v1/objects?departmentIds=1


# single Objects
# https://collectionapi.metmuseum.org/public/collection/v1/objects/437133

# example from that page
# https://collectionapi.metmuseum.org/public/collection/v1/objects/436535

# images
# https://images.metmuseum.org/CRDImages/ep/original/DT1567.jpg

# get all departments
# https://collectionapi.metmuseum.org/public/collection/v1/departments


# search stuff
# https://collectionapi.metmuseum.org/public/collection/v1/search?q=sunflowers
# https://collectionapi.metmuseum.org/public/collection/v1/search?q=VanGogh











