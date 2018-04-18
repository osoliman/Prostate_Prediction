library(shiny)
library(scales)
PSA <- read.csv("https://www.dropbox.com/s/euu38e14088c1bo/Data.csv?dl=1")
model <- glm(Cancer ~ Race + Age + PSA, data = PSA,family=binomial)

PCPredict <- function(select, Age, PSA)
  predict(model, data.frame(Race = select, Age = Age,
                            PSA = PSA), type
          = "response")[1]

server <- shinyServer(
  function(input, output){
    output$select <- renderPrint({input$select})
    output$Age <- renderPrint({input$Age})
    output$PSA <- renderPrint({input$PSA})
    output$prediction <- renderText({percent(PCPredict(as.numeric(input$select), 
                                                       input$Age, input$PSA))})
  }
)
