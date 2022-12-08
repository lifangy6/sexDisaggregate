#' Launch Shiny App for sexDisaggregate
#'
#' A function that launches the Shiny app for sexDisaggregate package.
#' The code has been placed in \code{./inst/shiny-scripts}.
#'
#' @return No return value but open up a Shiny page.
#'
#' @examples
#' \dontrun{
#'
#' sexDisaggregate::runSexDisaggregate()
#'
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#'
#' Silva, A. (2022) TestingPackage: An Example R Package For BCB410H.
#' Unpublished. URL https://github.com/anjalisilva/TestingPackage.
#'
#'
#' @export
#'
#' @importFrom shiny runApp
runSexDisaggregate <- function() {

  appDir <- system.file("shiny-scripts",
                        package = "sexDisaggregate")
  actionShiny <- shiny::runApp(appDir, display.mode = "normal")
  return(actionShiny)
}



# [END]
