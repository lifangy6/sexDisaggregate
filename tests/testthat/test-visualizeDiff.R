# context("Checking for visualizeDiff performance")
# library(sexDisaggregate)

test_that("Error upon invalid user input", {

  # Non-character input
  expect_error(visualizeDiff(filepath = 0,
                sexTag = "Sex",
                yTag = "Asthma",
                femaleTag = "Females",
                maleTag = "Males",
                visMethod = "bar"))

  expect_error(visualizeDiff(filepath = "data/asthma_dataset.csv",
                sexTag = 1,
                yTag = "Asthma",
                femaleTag = "Females",
                maleTag = "Males",
                visMethod = "bar"))

  expect_error(visualizeDiff(filepath = "data/asthma_dataset.csv",
                sexTag = "Sex",
                yTag = -1,
                femaleTag = "Females",
                maleTag = "Males",
                visMethod = "bar"))

  expect_error(visualizeDiff(filepath = "data/asthma_dataset.csv",
                sexTag = "Sex",
                yTag = "Asthma",
                femaleTag = 63.5,
                maleTag = "Males",
                visMethod = "bar"))

  expect_error(visualizeDiff(filepath = "data/asthma_dataset.csv",
                sexTag = "Sex",
                yTag = "Asthma",
                femaleTag = "Females",
                maleTag = TRUE,
                visMethod = "bar"))

  expect_error(visualizeDiff(filepath = "data/asthma_dataset.csv",
                sexTag = "Sex",
                yTag = "Asthma",
                femaleTag = "Females",
                maleTag = "Males",
                visMethod = NA))

  # Invalid visMethod input (can only be "bar" or "density")
  expect_error(visualizeDiff(filepath = "data/asthma_dataset.csv",
                sexTag = "Sex",
                yTag = "Asthma",
                femaleTag = "Females",
                maleTag = "Males",
                visMethod = "what"))

})
