#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(car)    # Import library to use recode() function

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    # Calculate the insurance premium 
    observe({
        values$prm <- input$CarValue*0.1* (1-input$NCD/100)
        })
  
        # Display values entered
    output$text_CarValue <- renderText({
        input$Calc
        paste("CarValue: [$]", isolate(input$CarValue))
    })
    
    output$text_NCD<- renderText({
        input$Calc
        paste("NoClaimsDiscount: ", isolate(input$NCD), 
              " % ")
    })

    # Display calculated values
    
    output$text_prm <- renderText({
        if(input$Calc == 0) ""
        else
            paste("Premium [$]:", values$prm)
    })
})