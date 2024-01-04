#' Frequency Polygon
#'
#' Calculates the coordinates to plot the frequency polygon density estimate.
#' This function creates a frequency polygon by
#' extracting components of a density histogram object and estimating density
#' at locations excluding midpoints.
#'
#'
#' @param x A numeric vector of data values
#' @param ... Additional arguments to be passed to the \code{hist} function
#'
#' @importFrom graphics "hist"
#'
#' @export
#'
#' @family  densr
#'
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#' @return An object of class \code{list} containing coordinates for plotting
#' the frequency polygon. Midpoint of density histogram represented by the
#' x-coordinate (\code{vx}), and the corresponding density values represented
#' by the y-coordinate (\code{vy})
#'
#' @seealso \code{\link{hist}}
#'
#' @examples
#' fp <- frequency_polygon(x = mtcars$mpg)
#'
frequency_polygon <- function(x, ...) {
  h <- graphics::hist(x, freq = FALSE) # density histogram
  vx <- h$mids
  vy <- h$density
  gapx <- diff(vx)[1]
  vx <- c(vx[1] - gapx, vx, vx[length(vx)] + gapx)
  vy <- c(0, vy, 0) # add 2 artificial bins at either end with a height of zero

  result <- list(vx = vx, vy = vy)
  return(result)
}

# View contents
str(hist(mtcars$mpg)) # has midpoints and bar height in list

# Pass same data through all 3 functions as a quick check
frequency_polygon(mtcars$mpg)

# Currently, all packages used throughout this code are attached base packages that are distributed in R by default
