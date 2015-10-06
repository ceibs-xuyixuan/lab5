library("jsonlite")
library("bitops")
library("RCurl")
context("looking for error")
test_that("error with address",{
  expect_that (as.numeric(geocode_GET("linkoping")[1, 1]), equals
        (58.410807))
  expect_that (as.numeric(geocode_GET("linkoping")[1,2]), equals
               (15.6213727))
})
