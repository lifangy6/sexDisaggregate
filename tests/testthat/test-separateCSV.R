# context("Checking for separateCSV performance")
# library(sexDisaggregate)

test_that("Error upon invalid user input", {

  # Non-character input
  expect_error(separateCSV(filepath = 0,
                           fpName = "my_data",
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = "M"))

  expect_error(separateCSV(filepath = "data/example_data.csv",
                           fpName = 1,
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = "M"))

  expect_error(separateCSV(filepath = "data/example_data.csv",
                           fpName = "my_data",
                           sexTag = -1,
                           femaleTag = "F",
                           maleTag = "M"))

  expect_error(separateCSV(filepath = "data/example_data.csv",
                           fpName = "my_data",
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = 63.5))

  expect_error(separateCSV(filepath = "data/example_data.csv",
                           fpName = "my_data",
                           sexTag = "Sex",
                           femaleTag = FALSE,
                           maleTag = "M"))

  expect_error(separateCSV(filepath = NA,
                           fpName = "my_data",
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = "M"))

})
