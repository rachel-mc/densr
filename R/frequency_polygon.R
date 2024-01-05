
#' Frequency Polygon
#'
#' Calculates the required coordinates to plot the frequency polygon density estimate.
#'
#' This function estimates this density at locations excluding the midpoints by linearly
#' interpolating between adjacent bar heights. The relevant components are extracted
#' from the histogram object created from the data.
#'
#' @param x A numeric vector of data
#' @param ... Additional arguments to be passed to the \code{hist} function
#'
#' @importFrom graphics "hist"
#'
#' @export
#'
#' @family densr
#'
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#' @return An object of class \code{list} containing coordinates for plotting
#' the frequency polygon. The midpoints of the density histogram are represented by the
#' x-coordinates (\code{vx}), and the corresponding density values (heights of the bars)
#' are represented by the y-coordinates (\code{vy})
#'
#' @seealso \code{\link{hist}}
#'
#' @examples
#' fp <- frequency_polygon(x = mtcars$mpg)
#'
frequency_polygon <- function(x, ...) {
  h <- graphics::hist(x, plot = FALSE)
  vx <- h$mids # pull out components of histogram object with dollar operator
  vy <- h$density
  gapx <- diff(vx)[1]
  vx <- c(vx[1] - gapx, vx, vx[length(vx)] + gapx)
  vy <- c(0, vy, 0) # add 2 artificial bins at either end with a height of zero

  result <- list(vx = vx, vy = vy)
  return(result)
}

# Currently, all packages used throughout this code are attached base packages that are distributed in R by default
