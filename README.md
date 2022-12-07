
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sexDisaggregate

To Obtain and Analyze Sex-disaggregated Datasets <!-- badges: start -->
<!-- https://www.codefactor.io/repository/github/lifangy6/sexDisaggregate/issues -->
[![GitHub
issues](https://img.shields.io/github/issues/lifangy6/sexDisaggregate)](https://github.com/lifangy6/sexDisaggregate/issues)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
![GitHub language
count](https://img.shields.io/github/languages/count/lifangy6/sexDisaggregate)
![GitHub commit activity
(branch)](https://img.shields.io/github/commit-activity/y/lifangy6/sexDisaggregate/master)
<!-- https://shields.io/category/license --> <!-- badges: end -->

## Description

`sexDisaggregate` is an R package that separates CSV datasets by sex,
performs comparison visualization and helps users to examine their
datasets from a sex-disaggregated perspective.

## Installation

To install the latest version of the package:

``` r
require("devtools")
devtools::install_github("lifangy6/sexDisaggregate", build_vignettes = TRUE)
library("sexDisaggregate")
```

## Overview

``` r
ls("package:sexDisaggregate")
data(package = "sexDisaggregate")
browseVignettes("sexDisaggregate")
```

<br> `sexDisaggregate` contains 2 functions:

Function `separateCSV` separates provided CSV file into 3 new datasets:
cleaned version, female-only and male-only.

Function `visualizeDiff` visualize 4 graphs that show sex percentage and
sex vs. specific category in the dataset.

<br> To run the shinyApp:

``` r
sexDisaggregate::runSexDisaggregate()
```

## Contributions

The author of the package is Fangyi Li. Packages `ggplot2` and `cowplot`
are used to help visualizing and outputing data.

## References

- Claus O. Wilke (2017). cowplot: Streamlined Plot Theme and Plot
  Annotations for ‘ggplot2’. <https://github.com/wilkelab/cowplot>.

- Heinemann, A., Martinez, V. M., & Alas, C. R. (n.d.). Why we need more
  sex-disaggregated Social Protection Data and what we’re doing to get
  there. World Bank Blogs. Retrieved November 14, 2022, from
  <https://blogs.worldbank.org/opendata/why-we-need-more-sex-disaggregated-social-protection-data-and-what-were-doing-get-there>

- R Core Team (2022). R: A language and environment for statistical
  computing. R Foundation for Statistical Computing, Vienna, Austria.
  <https://www.R-project.org/>.

- Wickham, H. and Bryan, J. (2019). R Packages (2nd edition). Newton,
  Massachusetts: O’Reilly Media. <https://r-pkgs.org/>

- Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
  Springer-Verlag New York. ISBN 978-3-319-24277-4,
  <https://ggplot2.tidyverse.org>.

- Silva, Anjali. “Anjalisilva/TestingPackage: A Simple R Package
  Illustrating Components of an R Package: 2019-2022 BCB410H - Applied
  Bioinformatics, University of Toronto, Canada.” GitHub,
  <https://github.com/anjalisilva/TestingPackage>.

## Acknowledgements

This package was developed as part of an assessment for 2022 BCB410H:
Applied Bioinformatics course at the University of Toronto, Toronto,
CANADA. `sexDisaggregate` welcomes issues, enhancement requests, and
other contributions. To submit an issue, use the [GitHub
issues](https://github.com/lifangy6/sexDisaggregate/issues). Many thanks
to those who provided feedback to improve this package.

## Tree Structure

``` r
- sexDisaggregate
  |- sexDisaggregate.Rproj
  |- DESCRIPTION
  |- NAMESPACE
  |- LICENSE
  |- README
  |- data
    |- asthma_dataset.csv
    |- example_data.csv
  |- inst
    CITATION
    |- extdata
      |- example_barplot.png
      |- example_densityplot.png
    |- shiny-scripts
      |- app.R
  |- man
    |- separateCSV.Rd
    |- visualizeDiff.Rd
  |- R
    |- separateCSV.R
    |- visualizeDiff.R
  |- vignettes
    |- Introduction_sexDisaggregate.Rmd
  |- tests
    |- testthat.R
    |- testthat
      |- test-separateCSV.R
      |- test-visualizeDiff.R
```

## Examples

**Step 1. Separate example dataset**

``` r
exampleDataPath <- system.file("extdata", "example_data.csv", package = "sexDisaggregate")
dataList <- sexDisaggregate::separateCSV(filepath = exampleDataPath, sexTag = "Sex", femaleTag = "F", maleTag = "M")
dataList
```

**Step 2.1: Bar plot approach**

``` r
plots1 <- visualizeDiff(dataList = dataList, yTag = "Asthma", visMethod = "bar")
plots1
```

<div style="text-align:center">

<img src="inst/extdata/example_barplot.png" alt="ShinyLinePlot" width="750" height="650"/>

**Step 2.2: Density plot approach**

``` r
plots2 <- visualizeDiff(dataList = dataList, yTag = "Sodium Intake (mg)", visMethod = "density")
plots2
```

<div style="text-align:center">

<img src="inst/extdata/example_densityplot.png" alt="ShinyLinePlot" width="750" height="650"/>
