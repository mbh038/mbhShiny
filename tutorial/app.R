library(shiny)

# Define UI ----
ui <- fluidPage(
    fluidRow(
      column(4,
             
             # Copy the line below to make a slider bar 
             sliderInput("slider1", label = h3("Slider"), min = 0, 
                         max = 100, value = 50)
      ),
      column(4,
             
             # Copy the line below to make a slider range 
             sliderInput("slider2", label = h3("Slider Range"), min = 0, 
                         max = 100, value = c(40, 60))
      )
    ),
    
    hr(),
    
    fluidRow(
      column(4, verbatimTextOutput("value")),
      column(4, verbatimTextOutput("range"))
    )
    
  )


# Define server logic ----
server <- function(input, output) {
  
  output$value <- renderPrint({ input$slider1 })
  output$range <- renderPrint({ input$slider2 })
  
}

# Run the app ----
shinyApp(ui = ui, server = server)