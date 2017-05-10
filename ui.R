
library(shiny)
library(readr)
#myURL <- "http://fenixservices.fao.org/faostat/static/bulkdownloads/Production_Crops_E_All_Data_(Normalized).zip"
crops <- read_csv("Production_Crops_E_All_Data_(Normalized).csv")
#crops <- read.csv(url(URL))
#crops <- read.table(unz(myURL, "Crops.dat"))
#crops <- read.table("Production_Crops_E_All_Data_(Normalized).csv")
crops <- crops[crops$Element=="Production",]
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("FAO Crop Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons("crop", "Crop Type:",
                   c("Beans" = "Beans, dry",
                     "Potatoes" = "Potatoes",
                     "Rice" = "Rice, paddy",
                     "Vegetables (total)" = "Vegetables Primary")),
      radioButtons("country", "Country:",
                   c("Bangladesh" = "Bangladesh",
                     "Cambodia" = "Cambodia",
                     "Vietnam" = "Viet Nam")),
       sliderInput("start",
                   "Start Year:",
                   min = 1960,
                   max = 2014,
                   value = 1961),
      sliderInput("end",
                  "End Year:",
                  min = 1961,
                  max = 2015,
                  value = 2014)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("cropPlot"
                  )
    )
  )
))
