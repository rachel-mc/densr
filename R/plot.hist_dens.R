
# Vignette notes:

# Respects the genericFunction.class() naming convention
# A method must implement the arguments in the generic at a minimum, but may contain further named arguments if desired
# Our plot.method() matches the arguments of the generic 'plot' (see formals(plot))
# The generic plot() already exists (don't need to create it)
# We use curve() to overlay normal densities from dnorm() and lines to overlay the other density options
# # plot.hist_dens(mtcars$mpg) gives an error: x is not of class hist_dens

#' plot.hist_dens Method
#'
#' A method defined to plot an object of class \code{"hist_dens"}.
#'
#' This function overlays a density estimate, based on the
#' type specified i.e. Gaussian, kde, or fp, to a histogram of the data \code{x}
#' supplied to \code{\link{create_hist_dens}}.
#'
#' @param x An object of class \code{"hist_dens"}
#' @param ... Different possible arguments that may be passed to \code{plot},
#' \code{curve}, or \code{lines}
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
#' @return A histogram of numeric data with an explicitly stated density option
#' superimposed on it.
#'
#' @note For this plot method to run efficiently,
#' the argument \code{x} must be of class \code{"hist_dens"}
#'
#' @seealso \code{\link{create_hist_dens}} to create objects of class
#' \code{"hist_dens"}
#'
#' @examples
#' x1 <- create_hist_dens(mtcars$mpg, type="kde", bw=2)
#' plot(x1)
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
