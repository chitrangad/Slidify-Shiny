library(shiny)
library(plotly)
library(UsingR)
data(mtcars)

model<-lm(mpg ~ hp, data = mtcars)
df1<-mtcars[1,]

shinyServer(
        function(input, output) {
                output$inputValue <- renderPrint({input$hp})
                output$prediction <- renderPrint({ 
                        
                        df1$hp <- input$hp
                        df1$predicted<-predict(model, newdata=df1)
                        paste("The predicted MPG is  :", df1$predicted)})
                
                output$graph <- renderPlot({
                        
                        plot(mtcars$mpg, mtcars$hp, xlab="Miles per Gallon",ylab="HP of the car",bty = "n", pch = 16,
                             xlim = c(1, 40), ylim = c(5, 250))
                        abline(model, col = "red", lwd = 2)
                                                })
                })