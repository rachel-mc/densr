
#' @title Constructing a continuous density estimator using histograms
#'
#' @description Calculates the coordinates required to plot the frequency
#' polygon density estimate. Estimates the density at locations excluding
#' midpoints by linearly interpolating between adjacent bar heights. The
#' constituent elements are then extracted from the output of \code{hist}.
#'
#' @param x A numeric vector of data, including integers.
#' @param ... Optional additional arguments that are specific to the \code{hist}
#' function.
#'
#' @return A list which contains the coordinates for plotting the frequency
#' polygon. The midpoints of the density histogram are represented by the
#' x-coordinates (\code{vx}), and the corresponding density values (heights of
#' the bars) are represented by the y-coordinates (\code{vy}).
#'
#' @export
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>,
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>,
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#' @family densr
#'
#' @seealso \code{\link{hist}} for different possible named arguments that may
#' be passed to \code{frequency_polygon}
#'
#' @examples
#' frequency_polygon(x = mtcars$mpg)
#' frequency_polygon(iris$Sepal.Length, breaks = seq(4, 8, 0.2))
frequency_polygon <- function(x, ...) {
  h <- graphics::hist(x, plot = FALSE, ...)
  vx <- h$mids # pull out components of histogram object with dollar operator
  vy <- h$density
  gapx <- diff(vx)[1]
  vx <- c(vx[1] - gapx, vx, vx[length(vx)] + gapx)
  vy <- c(0, vy, 0) # add 2 artificial bins at either end with a height of zero

  result <- list(vx = vx, vy = vy)
  return(result)
}

# Currently, all packages used throughout this code are attached base packages that are distributed in R by default
