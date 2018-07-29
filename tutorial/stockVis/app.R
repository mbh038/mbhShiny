# Load packages ----
library(shiny)
library(quantmod)

# Source helpers ----
source("helpers.R")

# User interface ----
ui <- fluidPage(
  titlePanel("submitButton example"),
  fluidRow(
    column(3, wellPanel(
      sliderInput("n", "N:", min = 10, max = 1000, value = 200,
                  step = 10)
    )),
    column(6,
           plotOutput("plot1", width = 400, height = 300),
           verbatimTextOutput("text")
    )
  )
)


server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    hist(rnorm(input$n))
  })
}

# Run the app
shinyApp(ui, server)
