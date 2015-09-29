#' Create GET request
#' 
#' Make GET request to Google Geocode API.
#' 
#' @param address the address is real address that you wish to search.
#' @param component short name of country
geocode_GET <- function(address, component = NULL){
  address1 <- gsub("\\s", "+", address)
  if (is.null(component)){
    link <- paste("https://maps.googleapis.com/maps/api/geocode/json?","address=", address1, "&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8", sep="")
  } else {
    link <-paste("https://maps.googleapis.com/maps/api/geocode/json?","address=", address1, "&components=country", component, "&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8", sep="")
  }
  request <- getURL(link)
  # request
  geo <- fromJSON(request)
#   geo
#   class()
   if(geo$status == "OK"){
     address_formatted <- matrix(geo$results$formatted_address)
     lat <- matrix(geo$results$geometry$location$lat)
     lng <- matrix(geo$results$geometry$location$lng)
     geoma <-cbind(lat, lng, address_formatted)
     colnames(geoma) <- c("lat", "lng", "formatted address")
     return(geoma)
   }
}

# ## an example
# jsonData <- fromJSON("https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=country:ES&key=AIzaSyCoWpv7VCmdP_EZLEidQzUpxyOC-HC5Ui8")
# names(jsonData)
# jsonData
