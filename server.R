# server.R

library(leaflet)
library(dplyr)

shinyServer(function(input, output) {
      
      
      data <- read.csv("data/assignment.csv")
      indexna <- which(data$href=='')
      data$href[indexna] <- NA
      data1 <- data %>% mutate(popuptext = paste0("<a href='http://www.", href, "'>", desc, "</a>"))
      data1$popuptext[indexna] <- paste0("<a>",data1$desc[indexna],"</a>")
      
     
      x <- reactive({which(data1$area==input$area)}) 
  
      map1 <- reactive({data1 %>% leaflet() %>% addTiles() %>% 
        addCircleMarkers(lat=data1$lat[x()], lng=data1$lng[x()], popup=data1$popuptext[x()],    
                         color=data1$col[x()], clusterOptions = markerClusterOptions()) %>%
        addLegend(position="bottomright", labels=c("visited", "not visited"),
                  colors=c("red", "blue"))})
      
      output$text <- renderText({paste("Cafes in Melbourne:", input$area)})      
      output$map <- renderLeaflet({map1()})
      
      
      
}
)
