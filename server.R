library(e1071)
library(shiny)

shinyServer(function(input, output) {

  # observe({
  #   p <- as.double(input$rnorm_n)
  #   default_gamma <- 1 / p
  #   choices = list(
  #               ".5" = .5,
  #               ".01" = .01,
  #               ".05" = .05,
  #               ".1" = .1,
  #               "1" = 1,
  #               "10" = 10,
  #               "1/p" = default_gamma)
  #   updateSelectInput(session, "gamma",
  #                     choices = choices)
  # })
  
  get_data <- function(n, mean_1, sd_1, mean_2, sd_2) {
    # Returns a randomly generated (controlled by inputs) dataframe classified into two factors.
    set.seed(0)
    x1 = c(rnorm(n, mean_1, sd_1), rnorm(n, mean_2, sd_2))
    x2 = c(rnorm(n, mean_1, sd_1), rnorm(n, mean_2, sd_2))
    y = as.factor(c(rep(-1, n), rep(1, n)))
    data = data.frame(x1, x2, y)
    return(data)
  }
  
  get_plot <- function(data) {
    plot(data$x1, data$x2, col = data$y)
  }
  
  output$originalData <- renderPlot({
    get_plot(
      get_data(input$rnorm_n, input$rnorm_mean_1, input$rnorm_sd_1, input$rnorm_mean_2, input$rnorm_sd_2)
    )
  })
  
  plot_with_added_point <- function(data, add_x, add_y, add_class, kernel, cost, gamma){
    data_plus = rbind(data, c(as.double(add_x), as.double(add_y), as.double(add_class)))
    svm.mmc.linear2 = svm(y ~ .,
                          data = data_plus,
                          kernel = kernel,
                          cost = cost,
                          gamma = gamma)
    plot(svm.mmc.linear2, data_plus)
  }
  
  output$svmPlotAddPoint <- renderPlot({ 
    plot_with_added_point(
      get_data(input$rnorm_n, input$rnorm_mean_1, input$rnorm_sd_1, input$rnorm_mean_2, input$rnorm_sd_2),
      input$add_x, input$add_y, input$add_class, input$kernel, input$cost, input$gamma)
  })
  
  
  
})
