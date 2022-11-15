
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sexDisaggregate

To Obtain and Analyze Sex-disaggregated Datasets

<!-- badges: start -->
<!-- badges: end -->

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

`sexDisaggregate` contains 2 functions:

Function `separateCSV` separates provided CSV file into 3 new datasets:
cleaned version, female-only and male-only.

Function `visualizeDiff` visualize 4 graphs that show sex percentage and
sex vs. specific category in the dataset.

To list all functions available in the package:

``` r
ls("package:sexDisaggregate")
```

To run the shinyApp: Under construction

## Examples

There is an example dataset `example_data.csv` under `/data` directory.

-   Example 1: Separate example dataset Run example code:

``` r
separateCSV(filepath = "data/example_data.csv", fpName = "my_data", sexTag = "Sex", femaleTag = "F", maleTag = "M")
```

Produced datasets can be found under `/data` directory.

-   Example 2: Bar plot approach Run example code:

``` r
visualizeDiff(filepath = "data/example_data.csv", sexTag = "Sex", yTag = "Asthma", femaleTag = "F", maleTag = "M", visMethod = "bar")
```

<div style="text-align:center">

<img src="inst/extdata/example_barplot.png" alt="ShinyLinePlot" width="750" height="550"/>

-   Example 3: Density plot approach Run example code:

``` r
visualizeDiff(filepath = "data/example_data.csv", sexTag = "Sex", yTag = "Sodium Intake (mg)", femaleTag = "F", maleTag = "M", visMethod = "density")
```

<div style="text-align:center">

<img src="inst/extdata/example_densityplot.png" alt="ShinyLinePlot" width="750" height="550"/>

## Contributions

The author of the package is Fangyi Li.

## References

-   Claus O. Wilke (2017). cowplot: Streamlined Plot Theme and Plot
    Annotations for ‘ggplot2’. URL
    <https://github.com/wilkelab/cowplot>. <br>
-   Heinemann, A., Martinez, V. M., & Alas, C. R. (n.d.). Why we need
    more sex-disaggregated Social Protection Data and what we’re doing
    to get there. World Bank Blogs. Retrieved November 14, 2022, from
    <https://blogs.worldbank.org/opendata/why-we-need-more-sex-disaggregated-social-protection-data-and-what-were-doing-get-there>
    <br>
-   R Core Team (2022). R: A language and environment for statistical
    computing. R Foundation for Statistical Computing, Vienna, Austria.
    <https://www.R-project.org/>. <br>
-   Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
    Springer-Verlag New York. ISBN 978-3-319-24277-4,
    <https://ggplot2.tidyverse.org>.

## Acknowledgements

This package was developed as part of an assessment for 2022 BCB410H:
Applied Bioinformatics course at the University of Toronto, Toronto,
CANADA. `sexDisaggregate` welcomes issues, enhancement requests, and
other contributions. To submit an issue, use the [GitHub
issues](https://github.com/lifangy6/sexDisaggregate/issues). Many thanks
to those who provided feedback to improve this package.
