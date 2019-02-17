library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Support Vector Machines"),
  fluidRow(
    column(4,
           fluidRow(
                    helpText("Generate a two-factor (red and black) distribution of data points",
                             "as input for the Support Vector Machine model.")
           ),
           fluidRow(
             column(12,align="center",
                    sliderInput("rnorm_n",
                                "Number of observations",
                                min = 25,
                                max = 250,
                                value = 100))
           ),
           fluidRow(
             # Set Random data points
             column(6,
                    sliderInput("rnorm_mean_1",
                                "Mean value of observations",
                                min = -5,
                                max = 5,
                                value = 5),
                    sliderInput("rnorm_sd_1",
                                "Standard deviation of observations",
                                min = 1,
                                max = 5,
                                value = 1)),
             column(6,
                    sliderInput("rnorm_mean_2",
                                "Mean value of observations",
                                min = -5,
                                max = 5,
                                value = -5),
                    sliderInput("rnorm_sd_2",
                                "Standard deviation of observations",
                                min = 1,
                                max = 5,
                                value = 1))
           ),
           fluidRow(
             column(12,
                    helpText("Define an extra data point (using tools below) to experiment",
                             "with affecting the SVM model."))
           ),
           fluidRow(
             column(12,align="center",
                    sliderInput("add_x",
                                "Extra data point X value",
                                min = -10,
                                max = 10,
                                value = 0),
                    sliderInput("add_y",
                                "Extra data point Y value",
                                min = -2,
                                max = 10,
                                value = 4),
                    selectInput("add_class", "Choose factor",
                                choices = c("Class 1" = 1,
                                            "Class -1" = -1)))
           ),
           fluidRow(
             column(12,
                    helpText("Define cost function, kernel type, and gamma value for the SVM model."))
           ),
           fluidRow(
             column(12,align="center",
                    selectInput("cost", "Choose cost function",
                                choices = c(".01" = .01,
                                            ".1" = .1,
                                            ".5" = .5,
                                            "1" = 1,
                                            "10" = 10,
                                            "1 million" = 1e6),
                                selected = "10"), 
                    sliderInput("gamma",
                                "Set gamma value",
                                min = .01,
                                max = 10,
                                value = .01, step = .05),
                    selectInput("kernel", "Choose kernel",
                                choices = c("radial" = "radial",
                                            "linear" = "linear")) )
           )
    ),
    column(8,
           # Output Graphs
           mainPanel(
             plotOutput("originalData"),
             plotOutput("svmPlotAddPoint")
           )
    )
  )
    
    
))
