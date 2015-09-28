library(jsonlite)
library(RCurl)
library(loadAPI)
context("looking for error")
test_that("error with address",{
#   expect_that (geocode_GET("linköping")$status, equals
#                ("INVALID_REQUEST"))
  expect_that (geocode_GET("linkoping")$status, equals
               ("OK"))
})