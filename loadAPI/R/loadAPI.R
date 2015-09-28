library(RJSONIO)
library(RCurl)
library(plyr)

geocode.addr <- function(uid_query) {
  # Avoid rate limits by pausing from 1 to 3 seconds
  Sys.sleep(sample(seq(1, 3, by=0.001), 1))
  # The important columns we want from our passed row
  uid <- uid_query$uid
  query <- uid_query$loc
  # You can also return the addresses as a simplified csv with this http://maps.google.com/maps/geo?output=csv&q=
  # or change that to output=xml which has more detailed results. 
  # This JSON request has a lot of good detail if you need it and JSON is nicer
  geo.url <- "http://maps.googleapis.com/maps/api/geocode/json?address="
  geo.text <- try(getURL(paste(geo.url, URLencode(query), "&sensor=false", sep="")))
  
  # If it didn't work with getURL, give it a go with readLines
  if(class(geo.text)=="try-error"){
    geo.text = try(readLines(paste(geo.url, URLencode(query), "&sensor=false", sep="")))
  }
  
  # Give up
  if (class(geo.text)=="try-error"){
    print(paste("having trouble reading this query:", uid))
  }
  
  geo.json <- fromJSON(geo.text)
  # There are other data points you can grab but I'm most interested in these. 
  if(geo.json$status == "OK"){
    print(uid)
    lat = geo.json$results[[1]]$geometry$location$lat
    lng = geo.json$results[[1]]$geometry$location$lng
    type = geo.json$results[[1]]$geometry$location_type
    info <- data.frame(uid, lat, lng, type, stringsAsFactors=F)
    return(info)
  } else{
    if(geo.json$status == "OVER_QUERY_LIMIT") {
      stop(paste("Hit rate limit at:", uid))
    } 
  }
}                
output = ddply(uid_address, .(uid), geocode.addr, .progress="text")