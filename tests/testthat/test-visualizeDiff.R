# context("Checking for visualizeDiff performance")
# library(sexDisaggregate)

test_that("Error upon invalid user input", {
  testData <- system.file("extdata", "example_data.csv", package = "sexDisaggregate")
  testList <- separateCSV(testData, "Sex", "F", "M")

  # Unexpected dataList
  expect_error(visualizeDiff(dataList = list(1, 2, 3),
                             yTag = "Asthma",
                             visMethod = "bar"))

  # Input errors (about character string)
  expect_error(visualizeDiff(dataList = testList,
                             yTag = 1,
                             visMethod = "bar"))

  expect_error(visualizeDiff(dataList = testList,
                             yTag = "Asthma",
                             visMethod = FALSE))

  expect_error(visualizeDiff(dataList = testList,
                             yTag = "Asthma",
                             visMethod = NA))

  expect_error(visualizeDiff(dataList = testList,
                             yTag = -1,
                             visMethod = "bar"))

  expect_error(visualizeDiff(dataList = testList,
                             yTag = "Asthma",
                             visMethod = 0.63))

  # Invalid visMethod input (can only be "bar" or "density")
  expect_error(visualizeDiff(dataList = testList,
                             yTag = "Asthma",
                             visMethod = "whatttt"))

  # Invalid yTag (does not exist)
  expect_error(visualizeDiff(dataList = testList,
                             yTag = "doggie",
                             visMethod = "bar"))

})



# [END]
