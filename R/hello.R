# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}


# To add Imports, example:
#::use_package("mclust", type = "Imports",
#                    min_version = "5.3.0")

#devtools::document()
# Should see DESCRIPTION updated

# If want to use roxygen with markdown
#usethis::use_roxygen_md()
# Setting RoxygenNote field in DESCRIPTION to ’6.1.1’

# After License, manually add to DESCRIPTION
# Depends: R (>= 3.1.0)
#devtools::document()

# To add Suggests, example:
#usethis::use_package("RTCGA.rnaseq", type = "Suggests")


# Tests go into [test -> testthat] directory, not just test
