download_met_images_by_id <- function(ids,
                                      download = "primaryImage") {
  # Obtain meta description objects from MET API
  # in order to extract URLs of pictures
  obj_list <- lapply(ids, function(x) {
    req <- sprintf("https://collectionapi.metmuseum.org/public/collection/v1/objects/%s",
                   x)
    fromJSON(req)
  })

  # Extract the list elements that contains
  # img URLs in order to pass it to the download function
  img_urls <- lapply(obj_list, "[[", download)
  # Note the implicit return, no return statement needed
  # last un-assigned statement is returned from the function
  lapply(seq_along(img_urls), function(x) {
    download.file(img_urls[[x]],
                  destfile = sprintf("data/%d.jpg", x)
    )
  })
}
