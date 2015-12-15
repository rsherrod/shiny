library(shiny)

# Define UI for sample size application 
shinyUI(fluidPage(
        
        # Application title, br() inserts a blank line
        titlePanel("Impact of Sample Size on Normal Distribution"),
        br(),

        # Sidebar with controls to select the normal distribution
        # and number of observations to generate. 
        sidebarLayout(
                sidebarPanel(
                        radioButtons("dist", "Distribution type:",
                                     c("Normal" = "norm")),
                        br(),
                        
                        sliderInput("n", 
                                    "Sample size:", 
                                    value = 2500,
                                    min = 100,
                                    step= 20,
                                    max = 5000)
                ),
                
                # Show a tabset that includes a plot, mean, stdev, and head of the sample
                # of the generated distribution
                mainPanel(
                        tabsetPanel(type = "tabs", 
                                    tabPanel("Plot", plotOutput("plot")), 
                                    tabPanel("Mean", verbatimTextOutput("summary")),
                                    tabPanel("StDev", verbatimTextOutput("summary2")),
                                    tabPanel("First 5 Rows", verbatimTextOutput("summary3"))
                                    )
                )
        )
))