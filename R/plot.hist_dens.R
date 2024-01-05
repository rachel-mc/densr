# Function 3: Method (reflected in name: . followed by class)

# Define plot.hist_dens method for "hist_dens" class
# Respect the genericFunction.class() naming convention and at a minimum match the arguments of the generic 'plot'

# Function called plot that will only work on objects of class "hist_dens"

# The generic plot() already exists - don't need to create it - so we write a plot method for the class hist_dens
# plot.method() must use the same arguments as the plot() generic, namely x and ..., see formals(plot)
# ... for different possible arguments
# A method must implement the arguments in the generic at a minimum, but may contain further named arguments if desired

# Must use curve() for dnorm() and lines to overlay the other density options

#' Histogram density overlay plot method
#'
#' Method created to plot an object of class \code{"hist_dens"} using the
#'  \code{plot.hist_dens}. This method overlays the histogram and density
#'  estimates based on the specified type, ie. Gaussian, kde, or fp.
#'
#' @param x Object of class \code{"hist_dens"}
#' @param ... Additional arguments to be passed to
#'
#' @importFrom graphics "curve" "lines"
#' @importFrom stats "dnorm" "sd"
#'
#' @export
#'
#' @family densr
#'
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#' @return NULL
#'
#' @note The input \code{x} must be of class \code{"hist_dens"}
#'
#' @seealso \code{\link{create_hist_dens}} to create objects of class
#' \code{"hist_dens"}
#'
#' @examples
#' plot(create_hist_dens(mtcars$mpg, type="kde", bw=2))
#' plot(create_hist_dens(iris$Sepal.Length, type="fp"))
#'
plot.hist_dens <- function(x, ...) {
  if(!inherits(x, "hist_dens")) stop("x must be of class \"hist_dens\"")

  h <- x$h # Pull out histogram, density and type from hist_dens object
  d <- x$d
  type <- x$type

  plot(h, freq = FALSE, ...) # for density histogram
  # object of class histogram is plotted by plot.histogram

  switch(type,
         gaussian = graphics::curve(stats::dnorm(x, mean(x), stats::sd(x), ...), add = TRUE, ...),
         kde = graphics::lines(d, ...),
         fp = graphics::lines(d$vx, d$vy, ...))
}

# Test this function by producing some plots
# Basic check with no additional arguments - all options work :)
#x1 <- create_hist_dens(mtcars$mpg) # default
#plot(x1)

#x2 <- create_hist_dens(mtcars$mpg, type = "kde")
#plot(x2)

#x3 <- create_hist_dens(mtcars$mpg, type = "fp")
#plot(x3)

#plot(create_hist_dens(iris$Sepal.Length, type="kde", bw=3))

#plot.hist_dens(mtcars$mpg)
