library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("MPG prediction"),
    
    sidebarPanel(
      p('This application will predict the MPG of cars with the car weight, 1/4 mile time, and transmission type as inputs.'),
      div('Please choose the inputs according to the features of your car, and then click the GO! button.', style="color:blue"),
      sliderInput('wt', 'Weight in tons', 1.5, min = 0.5, max = 3, step = 0.1),
      sliderInput('qsec', '1/4 mile time in seconds', 18.0, min = 14, max = 25, step = 0.1),
      radioButtons('am', 'Type of transmission',
                   choices = list("Automatic" = "Automatic", "Manual" = "Manual")),
      actionButton("goButton", "GO!")
    ),
    
    mainPanel(
      h3('Result of Predition'),
      h4('For a car with weight of '),
      verbatimTextOutput("inputwt"),
      h4('1/4 mile time of '),
      verbatimTextOutput("inputqsec"),
      h4('and '),
      verbatimTextOutput("inputam"),
      h4('The predicted MPG is'),
      verbatimTextOutput("prediction"),
      p('The predictive model was built using the mtcars dataset with linear regression method.')
    )
  )
)
