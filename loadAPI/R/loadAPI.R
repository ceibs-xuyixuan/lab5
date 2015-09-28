#' Create GET request
#' 
#' Make GET request to Google Geocode API.
#' 
#' @param address the address is real address that you wish to search.

geocode_GET <- function(address){
  link <- paste("https://maps.googleapis.com/maps/api/geocode/json?","address=", address, "&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8", sep="")
  request <- getURL(link)
  # request
  geo <- fromJSON(request)
  geo
}
# ## an example
# jsonData <- fromJSON("https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=country:ES&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8")
# names(jsonData)
# jsonData
