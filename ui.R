ui <- shinyUI(fluidPage(
  titlePanel("Disease prediction e.g. Prostate Cancer"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = h3("Choose Dichotomous variable e.g.Race"),
                  choices = list("Category 1" = 1, "Category 2" = 2),
                  selected = 1),
      numericInput("Age", label = h3("Continous1 e.g. Age"), 40, min = 15, max = 70),
      numericInput("PSA", label = h3("Continuous2 e.g. PSA"), 4, min = 0, max = 20),
      submitButton('Submit')
      
    ),
    mainPanel(
      h2('Results of prediction'),
      h4('You entered'),
      h4('Dichotomous choice'),
      verbatimTextOutput("select"),
      textOutput("text1"),
      h4('Continuous1 e.g. Age'),
      verbatimTextOutput("Age"),
      h4('Continuous2 e.g. PSA'),
      verbatimTextOutput("PSA"),
      h4('The probability of developing the disease'),
      verbatimTextOutput("prediction"),
      h4("Is the patient's risk"))
    
  ),
  hr(),
  h2("Disclaimer: This app is developed solely for educational purposes. It shall not be used in any way in clinical settings. All Rights Reserved - Omar Soliman (osolimanbwh@gmail.com)")
))
shinyApp(ui,server)
