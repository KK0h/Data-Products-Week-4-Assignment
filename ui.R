# ui.R

library(leaflet)
library(dplyr)

shinyUI(fluidPage(
      titlePanel("Melbourne cafes"),
      
      sidebarLayout(
            sidebarPanel(
                  helpText("This map shows eighty of the best cafes 
                           in Melbourne as recommended by 
                           goodfood.com.au* and ladyironchef.com**.
                           (Created: 20 April 2017)"),
                  tags$a(href='http://www.goodfood.com.au/eat-out/best-of/melbournes-top-50-cafes-2016-20160516-gos8ks',
                     "* www.goodfood.com.au/eat-out/best-of/melbournes-top-50-cafes-2016-20160516-gos8ks"),
                  br(),
                  tags$a(href='http://www.ladyironchef.com/2015/06/melbourne-best-cafes/',
                     "** www.ladyironchef.com/2015/06/melbourne-best-cafes/"),
                  br(),
                  br(),
                  selectInput("area", "Choose an area (North, South, East, West,
                              or City) to display:",
                              c("North"="north", "South"="south", "East"="east",
                                "West"="west", "City"="city"))
                  ),
            
            mainPanel(
                  textOutput("text"),
                  br(),
                  leafletOutput("map"),
                  br(),
                  br(),
                  helpText("Circle markers with numbers on them indicate a cluster of cafes. 
                           Zoom in or click on a cluster marker to see the individual cafes."),
                  br(),
                  helpText("Click on a blue or red circle to see the name and address of a cafe.
                           Hover over this text and if the mouse arrow changes to a hand symbol, 
                           clicking on it links to the website for that cafe."),
                  br(),
                  helpText("As a reminder to myself of happy memories, those cafes I have visited
                           before are marked using red circles :)")
                  
                  
                  
            ))
))
