
#' Function 3: Histogram density plot method
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
#' @return
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
