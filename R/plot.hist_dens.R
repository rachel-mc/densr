# Function 3: Method (reflected in name: . followed by class)

# Function called plot that will only work on objects of class "hist_dens"

# The plot() generic already exists - don't need to create it - so we write a plot method for the class hist_dens
# plot.method() must use the same arguments as the plot() generic, namely x and ...
# ... for different possible arguments

# Must use curve() for dnorm() and lines to overlay the other density options

plot.hist_dens <- function(x, ...) {
  if(!inherits(x, "hist_dens")) stop("This function only works on objects of class \"hist_dens\"")

  h <- x$h # Pull out histogram, density and type from hist_dens object
  d <- x$d
  type <- x$type

  plot(h, freq = FALSE) # for density histogram
  # object of class histogram is plotted by plot.histogram

  switch(type,
         gaussian = graphics::curve(stats::dnorm(x, mean(x), stats::sd(x), ...), add = TRUE, ...),
         kde = graphics::lines(d, ...),
         fp = graphics::lines(d$vx, d$vy, ...))
}

# Test this function by producing some plots
# Basic check with no additional arguments - all options work :)
x1 <- create_hist_dens(mtcars$mpg) # default
plot(x1)

x2 <- create_hist_dens(mtcars$mpg, type = "kde")
plot(x2)

x3 <- create_hist_dens(mtcars$mpg, type = "fp")
plot(x3)

plot(create_hist_dens(iris$Sepal.Length, type="kde", bw=3))
