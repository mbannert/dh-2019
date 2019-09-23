library(grid)
library(shiny)
source("R/bullet.R")

shinyApp(
  ui = fluidPage(sidebarLayout(sidebarPanel(
    numericInput("members", "Number of participants", 27),
    numericInput("rstats", "Any Programming Exp?", 0),
    numericInput("html", "Statistics?", 0),
    numericInput("shiny", "R Language?", 0)
  ),
  mainPanel(
   plotOutput("plot")
  )
  ))
  ,
  server = function(input, output){
    output$plot <- renderPlot({
      techavg <- mean(c(input$rstats,
                        input$html,
                        input$shiny) / input$members)*100
      df1 <- data.frame(units = c("Prog.(%)","Stats(%)","R(%)"),
                        low = c(25,25,25),
                        mean = c(50,50,50),
                        high = c(100,100,100),
                        target = c(techavg,techavg,techavg),
                        value = c(100*(input$rstats/input$members),
                                  100*(input$html/input$members),
                                  100*(input$shiny/input$members)
                        )
      )
      g <- gridBulletGraphH(df1,bcol = c("#999999","#CCCCCC","#E1E1E1"),
                            vcol = "#333333",font = 20)
      g + title(paste("Usage Among Participants", sep=" "))
    })



  },
  options = list(port = 1234)


)
