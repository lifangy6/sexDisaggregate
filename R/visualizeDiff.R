#' Visualizing Sex vs. Target Category
#'
#' Examine the sex percentage of the dataset in pie charts. Examine sex vs.
#' specific category in the dataset in either bar plot or density plot.
#'
#' @param dataList A list of 3 dataframes created by separateCSV.
#' @param yTag A character string of target category title in the dataset
#'    provided.
#' @param visMethod A method for visualization. Current options are "bar" or
#'    "density".
#'
#' @return Returns a combined figure of
#'    (A) Overall Percentage (without Unspecified Sex)
#'    (B) Overall Percentage (with Unspecified Sex)
#'    (C) General Overall Distribution
#'    (D) Overall Distribution by Sex
#'
#' @examples
#' \dontrun{
#'
#' # Data preparation
#' exampleDataPath <- system.file("extdata",
#'                                "example_data.csv",
#'                                package = "sexDisaggregate")
#'
#' dataList <- sexDisaggregate::separateCSV(filepath = exampleDataPath,
#'                                sexTag = "Sex",
#'                                femaleTag = "F",
#'                                maleTag = "M")
#'
#' # Example 1: Target category is not a continuous and numeric value.
#' sexDisaggregate::visualizeDiff(dataList = dataList,
#'                                yTag = "Asthma",
#'                                visMethod = "bar")
#'
#' # Example 2: Target category is a continuous and numeric value.
#' sexDisaggregate::visualizeDiff(dataList = dataList,
#'                                yTag = "Sodium Intake (mg)",
#'                                visMethod = "density")
#' }
#'
#' @author {Fangyi Li, \email{fangyi.li@mail.utoronto.ca}}
#'
#' @references
#' R Core Team (2022). R: A language and environment for statistical
#'    computing. R Foundation for Statistical Computing, Vienna, Austria.
#'    URL https://www.R-project.org/.
#'
#' Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
#'    Springer-Verlag New York. ISBN 978-3-319-24277-4,
#'    https://ggplot2.tidyverse.org.
#'
#' Claus O. Wilke (2017). cowplot: Streamlined Plot Theme and Plot Annotations
#'    for 'ggplot2'. URL 	https://github.com/wilkelab/cowplot.
#'
#' @export
#'
#' @import ggplot2
#' @import cowplot
#'
visualizeDiff <- function(dataList,
                          yTag,
                          visMethod) {
  # Input checks
  if (! is.list(dataList)) {
    stop("Make sure dataList is a list of three separated datasets (use separateCSV function).")
  }

  if (is.character(yTag) & is.character(visMethod)) {
    # pass
  } else {
    stop("Make sure yTag and visMethod are character string value.")
  }

  if (visMethod != "bar" & visMethod != "density") {
    stop('Invalid visMethod (can only be "bar" or "density").')
  }

  # Get dataframes from list
  bothSex <- dataList[[1]]
  femaleOnly <- dataList[[2]]
  maleOnly <- dataList[[3]]

  # Get # of each group
  nTotal <- nrow(bothSex)
  nFemale <- nrow(femaleOnly)
  nMale <- nrow(maleOnly)
  nElse <- (nTotal - nFemale - nMale)

  # Draw percentage graphs
  femaleC <- "#F5B7B1"
  maleC <- "#AED6F1"
  naC <- "#ABB2B9"
  colorSet <<- c(femaleC, maleC, naC)
  yTag <<- yTag

  # Graph 1. Female vs. Male (percentage)
  s1 <<- c(nFemale, nMale)
  lbl1 <<- c("Female", "Male")
  pct1 <<- round(s1/sum(s1)*100)
  lbl1 <<- paste(lbl1, pct1)
  lbl1 <<- paste(lbl1, "%", sep = "")
  lbl1 <<- paste(lbl1, " (n = ", s1, ")", sep = "")

  g1 <- ~pie(s1,
             labels = lbl1,
             main="Overall Percentage (without Unspecified Sex)",
             col=colorSet)


  # Graph 2. Female vs. Male vs. NA
  s2 <<- c(nFemale, nMale, nElse)
  lbl2 <<- c("Female", "Male", "NA")
  pct2 <<- round(s2/sum(s2)*100)
  lbl2 <<- paste(lbl2, pct2)
  lbl2 <<- paste(lbl2, "%", sep = "")
  lbl2 <<- paste(lbl2, " (n = ", s2, ")", sep = "")

  g2 <- ~pie(s2,
             labels = lbl2,
             main="Overall Percentage (with Unspecified Sex)",
             col=colorSet)

  # Graph 3 & 4 (analyze target category)

  if (visMethod == "bar") {
    # 3.1 Overall distribution
    counts3 <<- table(bothSex[[yTag]])
    g3 <- ~barplot(counts3,
                   main="General Overall Distribution",
                   xlab=yTag)


    # 4.1 Separate distribution
    counts4 <<- table(bothSex$Sex, bothSex[[yTag]])
    g4 <- ~barplot(counts4,
                   main="Overall Distribution by Sex",
                   xlab=yTag,
                   col=colorSet,
                   legend = c("Female", "Male", "NA"),
                   beside=TRUE)

  } else if (visMethod == "density") {
    # 3.2 Overall distribution
    g3 <- ggplot2::ggplot(data=bothSex,
                          aes(x=.data[[yTag]])) +
      ggplot2::geom_density(adjust=1.5,
                            alpha=.4,
                            fill="#ABB2B9") +
      ggplot2::geom_vline(aes(xintercept=mean(.data[[yTag]], na.rm=T)),
                          color="red",
                          linetype="dashed",
                          linewidth=1) +
      ggplot2::ggtitle("General Overall Distribution")

    # 4.2 Separate distribution
    meanF <- mean(femaleOnly[[yTag]])
    meanM <- mean(maleOnly[[yTag]])
    meanE <- mean(subset(bothSex, bothSex$Sex == "NA")[[yTag]])
    meanLines <- data.frame(Sex = c("Female", "Male", "NA"),
                            groupMean = c(meanF, meanM, meanE))

    g4 <- ggplot2::ggplot(data=bothSex,
                          aes(x=.data[[yTag]], group=Sex, fill=Sex)) +
      ggplot2::geom_density(adjust=1.5,
                            alpha=.4) +
      ggplot2::scale_fill_manual(values=colorSet) +
      ggplot2::geom_vline(data=meanLines,
                          aes(xintercept=groupMean),
                          color=colorSet,
                          linetype="dashed",
                          linewidth=1,
                          show.legend = F) +
      ggplot2::ggtitle("Overall Distribution by Sex")
  }

  # Combine plots
  plots <- cowplot::plot_grid(g1, g2, g3, g4, labels = c("A", "B", "C", "D"))

  return(plots)
}



# [END]
