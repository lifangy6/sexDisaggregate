
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sexDisaggregate

To Obtain and Analyze Sex-disaggregated Datasets

<!-- badges: start -->
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
install_github("lifangy6/sexDisaggregate", build_vignettes = TRUE)
library("sexDisaggregate")
```

## Overview

``` r
ls("package:sexDisaggregate")
browseVignettes("sexDisaggregate")
```

<br> `sexDisaggregate` contains 2 functions:

Function `separateCSV` separates provided CSV file into 3 new datasets:
cleaned version, female-only and male-only.

Function `visualizeDiff` visualize 4 graphs that show sex percentage and
sex vs. specific category in the dataset. <br> <br> To run the shinyApp:
Under construction

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

There is an example dataset `example_data.csv` under `/data` directory.

**Example 1: Separate example dataset** <br> To run example code:

``` r
separateCSV(filepath = "data/example_data.csv", fpName = "my_data", sexTag = "Sex", femaleTag = "F", maleTag = "M")
```

Produced datasets can be found under `/data` directory.

**Example 2: Bar plot approach** <br> To run example code:

``` r
visualizeDiff(filepath = "data/example_data.csv", sexTag = "Sex", yTag = "Asthma", femaleTag = "F", maleTag = "M", visMethod = "bar")
```

<div style="text-align:center">

<img src="inst/extdata/example_barplot.png" alt="ShinyLinePlot" width="750" height="650"/>

**Example 3: Density plot approach** <br> To run example code:

``` r
visualizeDiff(filepath = "data/example_data.csv", sexTag = "Sex", yTag = "Sodium Intake (mg)", femaleTag = "F", maleTag = "M", visMethod = "density")
```

<div style="text-align:center">

<img src="inst/extdata/example_densityplot.png" alt="ShinyLinePlot" width="750" height="650"/>

## Contributions

The author of the package is Fangyi Li. <br> Packages `ggplot2` and
`cowplot` are used to help visualizing and outputing data.

## References

-   Claus O. Wilke (2017). cowplot: Streamlined Plot Theme and Plot
    Annotations for ‘ggplot2’. <https://github.com/wilkelab/cowplot>.

-   Heinemann, A., Martinez, V. M., & Alas, C. R. (n.d.). Why we need
    more sex-disaggregated Social Protection Data and what we’re doing
    to get there. World Bank Blogs. Retrieved November 14, 2022, from
    <https://blogs.worldbank.org/opendata/why-we-need-more-sex-disaggregated-social-protection-data-and-what-were-doing-get-there>

-   R Core Team (2022). R: A language and environment for statistical
    computing. R Foundation for Statistical Computing, Vienna, Austria.
    <https://www.R-project.org/>.

-   Wickham, H. and Bryan, J. (2019). R Packages (2nd edition). Newton,
    Massachusetts: O’Reilly Media. <https://r-pkgs.org/>

-   Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
    Springer-Verlag New York. ISBN 978-3-319-24277-4,
    <https://ggplot2.tidyverse.org>.

-   Silva, Anjali. “Anjalisilva/TestingPackage: A Simple R Package
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
