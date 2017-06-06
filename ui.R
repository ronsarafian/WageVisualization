
library(shiny)
library(ggplot2)
library(dplyr)
setwd("C:/exe2")

shinyUI(fluidPage(
  
  titlePanel("Income is Israel"),
  h5("by Ron Sarafian"),

  sidebarLayout(
    sidebarPanel(
       
       radioButtons("var", "Select Variable:",
                    c("Weekly Work Hours" = "workhours.week",
                      "Monthly Income from Salaried Work " = "income.month.work.salary",
                      "Hourly Income from Salaried Work" = "income.hour.work.salary")),
       
       sliderInput("years",
                   "Select Years Range:",
                   min = 1997,
                   max = 2014,
                   value = c(1997,2014)),
       
       checkboxGroupInput("gender", "Select Gender Group:",
                          c("All" = "Total",
                            "Male" = "Male",
                            "Female" = "Female"),
                          selected = "Total"),
       
       checkboxGroupInput("nation", "Select Nationality Group:",
                          c("Jews" = "Jews",
                            "Arabs" = "Arabs"),
                          selected = c("Arabs","Jews")),
       
       checkboxGroupInput("schoolig", "Select Years-of-Schooling Group:",
                          c("0-4" = "0to4",
                            "5-8" = "5to8",
                            "9-10" = "9to10",
                            "11-12" = "11to12",
                            "13-15" = "13to15",
                            "16+" = "16+"),
                          selected = c("11to12","13to15")),
       
       sliderInput("age",
                   "Select Age Group:",
                   min = 15,
                   max = 120,
                   value = c(18,67))
    ),

    mainPanel(
       plotOutput("distPlot")
    )
  )
))
