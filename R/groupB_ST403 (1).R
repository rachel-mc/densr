# my package plots a histogram 
# and overlays either a) parametric dnorm density estimate
# b) kde (with arguments), or c) frequency polygon


# preliminary stuff
h <- hist(iris$Petal.Length)
h # no data

h2 <- hist(iris$Petal.Length, plot=FALSE)
h2
plot(h2)

d <- density(iris$Petal.Length)
d # no data

# first approach (bit hacky, constructing a hist just to get data into the density plot, dodgy)
#' @seealso \code{\link[stats]{hist}}
my_histogram <- function(x, ...) {
  h <- hist(x, ...)
  attr(h, "Data") <- x
  class(h) <- "fancy_histogram"
  return(h)
}

my_density.fancy_histogram <- function(x, type = c("parametric", "kde", "frequency_polygon")) {
  type <- match.arg(type)
  x <- attr(x, "Data")
  d <- switch(type,
              parametric={
                
              },
              kde = {
                
              },
              fp = {
                
              })
  return(structure(d, class="my_density"))
}

# second approach (better)

# function 1
# take data as input and return an object with a class
# that contains something like
# result <- list(h=h, d=d)
# class(result) <- "hist_dens"
# return(result)

# inside function 1
h <- hist(x, ...)
d <- switch(type,
       parametric = parametric_density_function(x),
       kde = density(x, ...),
       fp = frequency_polygon(x, ...))

dotdotdot_density <- function(x, ...) {
  density(x, ...)
}

plot_hist_and_dens.hist_dens <- function(x, ...) {
  
}

dotdotdot_density(iris$Sepal.Length)$bw
dotdotdot_density(iris$Sepal.Length, bw=3)$bw

# option 3

# forget about the histogram!
