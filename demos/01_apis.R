# Get umbrellas from the MET ?
library(jsonlite)

# Write a custom function
# to keep everything private, avoid global objects !
download_met_images_by_id <- function(ids,
                                  download = "primaryImage") {
  obj_list <- lapply(ids, function(x) {
    req <- sprintf("https://collectionapi.metmuseum.org/public/collection/v1/objects/%s", x)
    fromJSON(req)
  })

  img_urls <- lapply(obj_list, "[[", download)
  lapply(seq_along(img_urls), function(x) {
    download.file(img_urls[[x]],
      destfile = sprintf("data/%d.jpg", x)
    )
  })
}


umbrellas_met <- fromJSON("https://collectionapi.metmuseum.org/public/collection/v1/search?q=umbrella")


download_met_images_by_id(umbrellas_met$objectIDs[1:5])


# Victoria and Albert does it in very similar fashion
download_vaa_images_by_id <- function(pid){
  pid <- na.omit(pid)
  img_urls <- sprintf("http://media.vam.ac.uk/media/thira/collection_images/%s/%s.jpg",
          substr(pid,1,6), pid)
  lapply(seq_along(img_urls), function(x) {

    tryCatch({
      download.file(img_urls[x],
                    destfile = sprintf("data/%s.jpg",
                                       pid[x]) )
    },
             error = function(e) message("Image could not be downloaded."))



  })

img_urls


}


umbrellas_vaa <- fromJSON("http://www.vam.ac.uk/api/json/museumobject/search?objectnamesearch=umbrella")



download_vaa_images_by_id(umbrellas_vaa$records$fields$primary_image_id)




umbrellas_vaa$records$fields$primary_image_id



