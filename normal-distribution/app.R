# Title: The normal distribution
# Description: Exploration of the normal distribution
# Author: Michael Hunt

library(shiny)

x <- seq(-10,10,0.1)

ui <- fluidPage(
  titlePanel("Normal Distribution"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      sliderInput("n", 
                  label = "Sample size:",
                  min = 0, max = 100, value = 20,step=1),
      
      sliderInput("mean", 
                  label = "Mean:",
                  min = -10, max = 10, value = 0,step=0.1),
      
      sliderInput("sdev", 
                  label = "Standard deviation:",
                  min = 0, max = 5, value = 1,step=0.1),
     
      textOutput("mean"),
      textOutput("sdev")
      ),
    
    mainPanel(
      plotOutput("ndist",width=500)
    )
  )
  )

server <- function(input, output) {
  
  output$selected_var <- renderText({ 
    paste("You have selected", input$var)
  })
  
  output$mean <- renderText({ 
    paste("Mean: ",
          input$mean)
  })
  
    output$sdev <- renderText({ 
    paste("Standard deviation: ",
          input$sdev)
  })
    
    output$ndist <- renderPlot({ 
      y1 <- dnorm(x,mean=input$mean,sd=input$sdev)
      ymax <- dnorm(0,mean=input$mean,sd=input$sdev)
      hist(rnorm(n=input$n,mean=input$mean,sd=input$sdev),freq=FALSE,main="",ylim=c(0,ymax))
      lines(x,y1,type="l",col="blue",lwd=2)

    })
  
}

shinyApp(ui, server)