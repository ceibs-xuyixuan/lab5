#' Create GET request
#' 
#' Make GET request to Google Geocode API.
#' 
#' @param address the address is real address that you wish to search.

geocode_GET <- function(address){
  address1 <- gsub("\\s", "+", address)
  link <- paste("https://maps.googleapis.com/maps/api/geocode/json?","address=", address1, "&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8", sep="")
  request <- getURL(link)
  # request
  geo <- fromJSON(request)
  # geo
  if(geo$status == "OK"){
    lat <- geo$results[[3]]$location$lat
    lng <- geo$results[[3]]$location$lng
    return (c(lat, lng, address))
  }
}

# ## an example
# jsonData <- fromJSON("https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=country:ES&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8")
# names(jsonData)
# jsonData
