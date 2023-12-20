# Function 3: Method (reflected in name: . followed by class)

# The plot generic already exists so we write a plot method for the class hist_dens

# Must use curve() for dnorm() and lines to overlay the other density options

plot.hist_dens <- function(x, ...) {
  h <- x$h # Pull out histogram, density and type from hist_dens object
  d <- x$d
  type <- x$type

  plot(h, freq = FALSE) # for density histogram
  # object of class histogram is plotted by plot.histogram

  switch(type,
         gaussian = curve(stats::dnorm(x, mean(x), sd(x), ...), add = TRUE, ...),
         kde = lines(d, ...),
         fp = lines(d$vx, d$vy, ...))
}

# Basic check with no additional arguments - all options work :)
x1 <- create_hist_dens(mtcars$mpg) # default
plot(x1)

x2 <- create_hist_dens(mtcars$mpg, type = "kde")
plot(x2)

x3 <- create_hist_dens(mtcars$mpg, type = "fp")
plot(x3)
