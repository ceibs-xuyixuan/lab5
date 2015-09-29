library("jsonlite", lib.loc="~/R/win-library/3.2")
library("bitops", lib.loc="~/R/win-library/3.2")
library("RCurl", lib.loc="~/R/win-library/3.2")
context("looking for error")
test_that("error with address",{
  expect_that (as.numeric(geocode_GET("linkoping")[1, 1]), equals
        (58.410807))
  expect_that (as.numeric(geocode_GET("linkoping")[1,2]), equals
               (15.6213727))
})
