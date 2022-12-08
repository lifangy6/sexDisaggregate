# context("Checking for separateCSV performance")
# library(sexDisaggregate)

test_that("Error upon invalid user input", {
  # Initialize
  testData <- system.file("extdata", "example_data.csv", package = "sexDisaggregate")

  # Input errors
  expect_error(separateCSV(filepath = testData,
                           sexTag = "Sex",
                           femaleTag = F,
                           maleTag = "M"))

  expect_error(separateCSV(filepath = testData,
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = 63.5))

  expect_error(separateCSV(filepath = inst/extdata/example_data.csv,
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = "M"))

  expect_error(separateCSV(filepath = NA,
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = "M"))

  expect_error(separateCSV(filepath = testData,
                           sexTag = "Sex",
                           femaleTag = "F",
                           maleTag = -1))

  expect_error(separateCSV(filepath = testData,
                           sexTag = TRUE,
                           femaleTag = "F",
                           maleTag = "M"))
})

test_that("Error upon false output", {
  # Initialize
  testData <- system.file("extdata", "example_data.csv", package = "sexDisaggregate")
  controlList <- read.csv(testData)
  testList <- separateCSV(testData, "Sex", "F", "M")

  # Output list names
  expect_equal(names(testList), c("bothSex", "femaleOnly", "maleOnly"))

  # Check if any lost during processing
  expect_equal(nrow(controlList), nrow(testList$bothSex))

})



# [END]
