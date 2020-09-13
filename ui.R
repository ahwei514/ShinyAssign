library(shiny)

shinyUI(fluidPage(
    titlePanel("Car Insurance Price Calculator"),
    sidebarLayout(
        sidebarPanel(
            helpText("The following is the basic calculator to calculate car insurance price."),            
            br(),            
            numericInput("CarValue",
                         label = h6("Enter the car sum insured (in $)"),
                         value = 1000),
            br(),            
            sliderInput("NCD",
                        label = h6("Enter the no claims discount (in %)"),
                        min = 0, max = 55, value = 5, step = 10),
            
            br(),
            br(),            
            actionButton("Calc", label = "Calculate!")        
            ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                         p(h5("Values you entered:")),
                         textOutput("text_CarValue"),
                         textOutput("text_NCD"),
                         br(),
                         p(h5("Calculated insurance premium:")),
                         textOutput("text_prm")
                ),
                tabPanel("Documentation",
                         p(h4("Car Insurance Premium Calculator:")),
                         br(),
                         helpText("This is a simple car insurance calculator"),
                         HTML("<u><b> Equation : </b></u>
                              <br> <br>
                              <b> Insurance Premium = SI*0.1 *(1-NCD) </b>
                              <br>
                              where: <br>
                              SI = Car Value <br>
                              NCD = No Claims Discount <br>
 
                              ")                
                         )
                         )
                         )
                         )
                         ))