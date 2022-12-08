# References:
# Grolemund, G. (2015). Learn Shiny - Video Tutorials. URL:https://shiny.rstudio.com/tutorial/
# Silva, A. (2022) TestingPackage: An Example R Package For BCB410H. Unpublished. URL https://github.com/anjalisilva/TestingPackage.

library(shiny)
library(shinyalert)

# Define UI
ui <- fluidPage(

  # Page title
  titlePanel("sexDisaggregate: To Obtain and Analyze Sex-disaggregated Datasets"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("This is a simple Shiny App that is part of the sexDisaggregate in R.
               Its purpose is to perform separation and analysis according to sex."),
      # br() element to introduce extra vertical spacing ----
      br(),

      tags$b("Description: sexDisaggregate is an R package to demonstrate possible
          sex bias in the dataset. This Shiny App is part of the sexDisaggregate.
          It takes a CSV file and perform analysis according to sex, such as sex
          percentage, etc. For more details, see ?separateCSV and ?visualizeDiff."),

      # br() element to introduce extra vertical spacing ----
      br(),
      br(),

      # input
      tags$p("Instructions: Below, enter or select values required to perform the analysis. Default
               values are shown. Then press 'Run'. Navigate through
               the different tabs to the right to explore the results."),

      # br() element to introduce extra vertical spacing ----
      br(),

      # inputs
      shinyalert::useShinyalert(force = TRUE),  # Set up shinyalert

      uiOutput("tab1"),
      actionButton(inputId = "data1",
                   label = "Dataset 1 Details"),
      fileInput(inputId = "file1",
                label = "Select a sex-embeded dataset to visualize. File should be in .csv format with a columns of sex.",
                accept = c(".csv")),
      textInput(inputId = "sexTag",
                label = "Enter the exact representation of the sex column (eg. Sex, sex, s, etc).", "Sex"),
      textInput(inputId = "femaleTag",
                label = "Enter the exact representation of female in the dataset (eg. F, female, etc).", "F"),
      textInput(inputId = "maleTag",
                label = "Enter the exact representation of male in the dataset (eg. M, male, etc).", "M"),
      textInput(inputId = "yTag",
                label = "Enter the exact representation of desired analyzing category in the dataset (eg. Asthma, Sodium Intake (mg), etc).", "Asthma"),
      selectInput("visMethod", "Choose a visualize method:",
                  choices = c("bar", "density")),

      # br() element to introduce extra vertical spacing ----
      br(),

      # actionButton
      actionButton(inputId = "button1",
                   label = "RUN")
    ),

    # Main panel for displaying outputs ----
    mainPanel(
      # Output: Tabset w/ plot, summary, and table ----
      plotOutput('plots')
    )
  )
)


# Define server logic for random distribution app ----
server <- function(input, output) {

  # Get CSV filepath
  dataPath <- eventReactive(eventExpr = input$button1, {
    if (! is.null(input$file1)) {
      input$file1$datapath
    }
  })

  # Get and separate CSV
  dataList <- eventReactive(eventExpr = input$button1, {

    sexDisaggregate::separateCSV(filepath = dataPath(),
                                 sexTag = input$sexTag,
                                 femaleTag = input$femaleTag,
                                 maleTag = input$maleTag)
  })

  # Output plots
  observeEvent(input$button1, {
    output$plots <- renderPlot({
      if (! is.null(dataList())) {
        sexDisaggregate::visualizeDiff(dataList = dataList(),
                                       yTag = input$yTag,
                                       visMethod = input$visMethod)
      }
    })
  })

  # URLs for downloading data
  url1 <- a("Example Dataset", href="https://raw.githubusercontent.com/lifangy6/sexDisaggregate/master/inst/extdata/example_data.csv")
  output$tab1 <- renderUI({
    tagList("Download:", url1)
  })

  observeEvent(input$data1, {
    # Show a modal when the button is pressed
    shinyalert(title = "Example Dataset",
               text = "This is a provided example dataset.",
               type = "info")
  })

}


# Create Shiny app ----
shiny::shinyApp(ui, server)



# [END]
