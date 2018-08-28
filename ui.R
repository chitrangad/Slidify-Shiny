shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Mileage prediction"),
                sidebarPanel(
                numericInput('hp', "Horse Power",20, min = 10 , max = 250, step = 5),
                submitButton('Submit'),
                h6('Vary the above values to see change in the predicted mpg value')
),
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered'),
                        verbatimTextOutput("inputValue"),
                        h4('Which resulted in a mpg of '),
                        verbatimTextOutput("prediction"),
                        h4('Here is the plot of HP vs predicted mpg'),
                        plotOutput('graph')
                )
        )
)