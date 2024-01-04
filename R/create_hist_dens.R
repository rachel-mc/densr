#' Class Constructor Function: create_hist_dens
#'
#' Function computes a histogram and chooses the density estimation provided by
#' user (default=Gaussian), assigning the result to class \code{"hist_dens"}
#'
#' @param x A numeric vector representing the data
#' @param type Character string specifying the type of density estimation to be
#' used. Options are "gaussian", "kde", and "fp"
#' @param ... Additional arguments to be passed to the density estimation
#' function
#'
#' @importFrom graphics "hist"
#' @importFrom stats "dnorm" "sd" "density"
#'
#' @export
#'
#' @family densr
#'
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#'
#' @return An object of class \code{"hist_dens"} containing the
#' histogram (\code{h}), density values (\code{d}) and type of density
#' estimation used (\code{type}).
#'
#' @seealso \code{\link[stats]{density}} for a complete list of arguments that
#'         can be passed when \code{type = "kde"}
#'          \code{\link{frequenxy_polygon}} to create frequency polygon density estimations 
#'           when type specified is \code{type = "fp"}
#' @examples
#'        create_hist_dens(mtcars$mpg, type="kde", bw=2)
#'        create_hist_dens(iris$Sepal.Length, type="fp")
#'
create_hist_dens <- function(x,
                      type = c("gaussian", "kde", "fp"), # fp is an abbreviation for frequency polygon
                      ...) {
  type <- match.arg(type)
  h <- suppressWarnings(graphics::hist(x, plot = FALSE, ...)) # don't want to return the histogram yet
  d <- switch(type,
              gaussian = stats::dnorm(x, mean(x), stats::sd(x), ...),
              kde = stats::density(x, ...),
              fp = frequency_polygon(x, ...))
  result <- list(h=h, d=d, type = type)
  class(result) <- "hist_dens"
  return(result)
}
