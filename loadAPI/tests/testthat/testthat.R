library("jsonlite", lib.loc="~/R/win-library/3.2")
library("bitops", lib.loc="~/R/win-library/3.2")
library("RCurl", lib.loc="~/R/win-library/3.2")
context("looking for error")
test_that("error with address",{
  expect_that (geocode_GET("linkoping")$status, equals
               ("OK"))
})