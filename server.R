
library(shiny)
library(ggplot2)
library(dplyr)
setwd("C:/exe2")

shinyServer(function(input, output) {
    
    df <- reactive({read.csv("wages.csv")
    })
    
   output$distPlot <- renderPlot({
    
    var <- input$var
    years <- input$years[1]:input$years[2]
    gender <- input$gender
    nation <- input$nation
    schooling <- input$schoolig
    age <- input$age[1]:input$age[2]
    
    dfselected <- df()[df()$.survey.year %in% years &
                        df()$gender %in% gender &
                        df()$nation %in% nation &
                        df()$schooling %in% schooling &
                        df()$age %in% age, c(".survey.year","gender","nation","schooling",var) ]
    colnames(dfselected)<-c(".survey.year","gender","nation","schooling","agg.var")
    
    agg <- ddply(dfselected, .(.survey.year,gender,schooling,nation), summarise,
                 mn = mean(agg.var, na.rm = T),
                 sd = sd(agg.var, na.rm = T))
    
    g <- ggplot(agg, aes(x = .survey.year, y = mn))
    g + geom_line(aes(colour = interaction(gender,schooling,nation))) +
        labs(x = "Year", y = var, colour = "Group")+
        scale_x_continuous(breaks = years)
    
  })
  
})