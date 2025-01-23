# Define server logic required to draw a plot ----
library(ggplot2)
server <- function(input, output) {
  

  rndData_x <-  rnorm(80, sd=5, mean=18)-3
  rndData_y <-  rnorm(80, sd=1.5, mean=12) - 4 * rndData_x^0.04 - 17
  
  
  
  output$distPlot <- renderPlot({
    x <- rndData_x
    y <- rndData_y
    
    x0 <- input$x0
    a <- input$a
    b <- input$b
    c <- input$c
    d <- input$d
    
    xrange <- seq(from=min(rndData_x), to=max(rndData_x), by=0.5)
    
    f <- a + b * (xrange-x0) + c*(xrange-x0)^2 + d*(xrange-x0)^3
    
    ypred <- a + b * (rndData_x-x0) + c*(rndData_x-x0)^2 + d*(rndData_x-x0)^3
    
    RMSE <- sqrt(mean((rndData_y - ypred)^2))
    
    plot(
      x, y,
      col = "black",
      border = "white",
      xlab = "x",
      ylab= "y",
      xlim=c(min(x) - 1.5*abs(max(x)),max(x) + 1.5*abs(max(x))),
      ylim=c(min(y) - 1.5*abs(max(y)),max(y) + 1.5*abs(max(y))),
      main = paste("RMSE = ", RMSE)
    )
    lines(xrange, f, col="green", type="l")
    grid(col="black")
    
  })
}