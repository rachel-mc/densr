# Test create_hist_dens() function

library(densr)

test_that("create_hist_dens produces valid output", {
  expect_error(create_hist_dens(iris$Sepal.Length, type = "exponential"))
  expect_error(create_hist_dens(mtcars$mpg, type = 2))
  expect_error(create_hist_dens(iris$Sepal.Length, type = c("fp", "kde")))
  expect_s3_class(create_hist_dens(iris$Sepal.Length), "hist_dens")
  expect_output(str(create_hist_dens(mtcars$mpg, type = "kde")), "List of 6")
})
