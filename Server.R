library(shiny)

MPGpred <- function(wt, qsec, am){
  if (am == "Automatic") amvalue = 0
  else amvalue = 1
  prediction<-18.088-5.873*(wt-1)+5.797*amvalue+1.107*(qsec-14)-8.283*wt*amvalue
## The multivariable linear model was built using the mtcars dataset
return(prediction)
} 


shinyServer(
  function(input, output){
    output$inputwt <- renderText({paste(input$wt, "tons")})
    output$inputqsec <- renderText({paste(input$qsec, "seconds")})
    output$inputam <- renderText({paste(input$am, "transmission")})
    output$prediction <- renderText({
      input$goButton
      isolate(MPGpred(input$wt, input$qsec, input$am))
    })
  }
)