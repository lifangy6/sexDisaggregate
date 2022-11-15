#' Separating CSV Dataset Into Three Groups
#'
#' Check each entry of the dataset, clean unformated sex entry to standardized
#' "Female"/"Male"/"NA", and output 3 cleanned versions of datasets into data/
#' directory.
#'
#' @param filepath A character string of the filepath to find your dataset.
#' @param fpName A character string of CSV dataset's name. Recommand use
#'    underscore instead of space.
#' @param sexTag A character string of sex column title in the dataset provided.
#' @param femaleTag A character string that represents "Female" in the dataset
#'    (e.g., "F", "Female", "FEMALE", etc).
#' @param maleTag A character string that represents "Male" in the dataset
#'    (e.g., "M", "Male", "MALE", etc).
#'
#' @return Returns three versions of cleaned datasets under /data directory:
#'    (1) Cleaned version of original dataset (sex is "Female", "Male" or "NA")
#'    (2) Female-only dataset
#'    (3) Male-only dataset
#'
#' @examples
#' sexDisaggregate::separateCSV(filepath = "data/example_data.csv",
#'                                fpName = "my_data",
#'                                sexTag = "Sex",
#'                                femaleTag = "F",
#'                                maleTag = "M")
#'
#' @author {Fangyi Li, \email{fangyi.li@mail.utoronto.ca}}
#'
#' @references
#' R Core Team (2022). R: A language and environment for statistical
#'   computing. R Foundation for Statistical Computing, Vienna, Austria.
#'   URL https://www.R-project.org/.
#'
#' @export
#'
separateCSV <- function(filepath,
                        fpName,
                        sexTag,
                        femaleTag,
                        maleTag) {
  # Input checks
  if (is.character(filepath) & is.character(fpName) & is.character(sexTag)
      & is.character(femaleTag) & is.character(maleTag)) {
    # pass
  } else {
    stop("Make sure all input should be character string value.")
  }

  # Read CSV file
  myCSV <- read.csv(file = filepath, header = T, check.names = FALSE)

  # Separate into three groups
  bothSex <- myCSV
  femaleOnly <- subset(myCSV, myCSV[[sexTag]] == femaleTag)
  maleOnly <- subset(myCSV, myCSV[[sexTag]] == maleTag)

  # Get # of each group
  nTotal <- nrow(myCSV)
  nFemale <- nrow(femaleOnly)
  nMale <- nrow(maleOnly)
  nElse <- (nTotal - nFemale - nMale)

  # Clean sex tags in dataset
  for (i in 1:nFemale) {
    femaleOnly[[sexTag]][i] <- "Female"
  }

  for (i in 1:nMale) {
    maleOnly[[sexTag]][i] <- "Male"
  }

  for (i in 1:nTotal) {
    if (bothSex[[sexTag]][i] == femaleTag) {
      bothSex[[sexTag]][i] <- "Female"
    } else if (bothSex[[sexTag]][i] == maleTag) {
      bothSex[[sexTag]][i] <- "Male"
    } else {
      bothSex[[sexTag]][i] <- "NA"
    }
  }

  # Output CSV into /data directory
  femalePath <- paste("data/", fpName, "_female_only.csv", sep="")
  malePath <- paste("data/", fpName, "_male_only.csv", sep="")
  cleanedPath <- paste("data/", fpName, "_cleaned.csv", sep="")

  write.csv(femaleOnly, femalePath, row.names = FALSE)
  write.csv(maleOnly, malePath, row.names = FALSE)
  write.csv(bothSex, cleanedPath, row.names = FALSE)
}



# [END]
