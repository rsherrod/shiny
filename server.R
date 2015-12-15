library(shiny)

# Define server logic for normal distribution application
shinyServer(function(input, output) {
        
        # Reactive expression to generate the normal distribution.
        # This is called whenever the inputs change. The output
        # functions defined below then all use the value computed from
        # this expression
        data <- reactive({
                dist <- switch(input$dist,
                               norm = rnorm,
                               rnorm)
                
                dist(input$n)
        })
        
        # Generate a plot of the data. 
        output$plot <- renderPlot({
                dist <- input$dist
                n <- input$n
                plot(density(data()), main=paste('Distribution: r', dist, '(', n, ')', sep=''), xlab="Value")
               
        })
        
        # Calculate mean of the data
        output$summary <- renderPrint({
               mean(data())
        })
        
        # Calculate sd of the data
        output$summary2 <- renderPrint({
                sd(data())
        })
        
        # Print first 5 records
        output$summary3 <- renderPrint({
                head(data(),n=5)
        })
        
})