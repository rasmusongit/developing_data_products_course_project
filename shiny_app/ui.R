library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  
  # App title ----
  title = "Hello. We will try and fit the shown data with the formula: y = a + b(x-x0) + c(x-x0)^2 + d(x-x0)^3",
  
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    
    # Input: Slider for coeff x0 ----
    sliderInput(
      inputId = "x0",
      label = "Fit coefficient x0",
      min = -50,
      max = 50,
      value = 0,
      step=0.05
    ),sliderInput(
      inputId = "a",
      label = "Fit coefficient a",
      min = -50,
      max = 50,
      value = 0,
      step=0.05
    ),
    # Input: Slider for coeff b ----
    sliderInput(
      inputId = "b",
      label = "Fit coefficient b",
      min = -10,
      max = 10,
      value = 0,
      step=0.05
    ),
    # Input: Slider for coeff c ----
    sliderInput(
      inputId = "c",
      label = "Fit coefficient c",
      min = -5,
      max = 5,
      value = 0,
      step=0.005
    ),
    # Input: Slider for coeff d ----
    sliderInput(
      inputId = "d",
      label = "Fit coefficient d",
      min = -2,
      max = 2,
      value = 0,
      step=0.0005
    )
  ),
  
  # Output: Plot ----
  plotOutput(outputId = "distPlot")
)