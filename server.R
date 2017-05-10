#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$cropPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R


    swingkey <- input$crop
    swingkey2 <- input$country
    crops <- crops[crops$Area == swingkey2,]
    crops <- crops[crops$Item == swingkey,]
    qplot(crops$Year, y = crops$Value, xlim = c(input$start,input$end), xlab = "Year", ylab = "Total Production (tonnes)")
  })
})
