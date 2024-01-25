
#' Create objects of class \code{hist_dens}
#'
#' Plots but does not return a histogram of the inputted data. A density
#' estimation type provided by the user is computed. A class \code{"hist_dens"}
#' is assigned to the result.
#'
#' @param x A numeric vector that represents the data.
#' @param type A character string specifying the type of density estimation to
#' be used. Options include either \code{"gaussian"} by default, \code{"kde"}, or
#' \code{"fp"} for parametric normal, nonparametric kernel, or continuous
#' density estimation respectively.
#' @param ... Additional named arguments to be passed through to \code{hist} or
#' the density estimation functions.
#'
#' @return An list containing the inputted data (\code{x}), the histogram
#' (\code{h}) and its components, density values (\code{d}), the type of
#' density estimation used (\code{type}), and the class attributed to the
#' object:\code{"hist_dens"}.
#'
#' @note This is a class constructor function. A separate dedicated
#' \code{\link{plot}} function is provided for \code{"create_hist_dens"}
#' output.
#'
#' @seealso \code{\link[stats]{density}} for a complete list of additional
#' kde-specific arguments that can be passed when \code{type = "kde"}.
#'          \code{\link{frequency_polygon}} to create frequency polygon density
#'          estimates when the type specified is \code{type = "fp"}.
#'
#' @family densr
#'
#' @export
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>,
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>,
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#' @examples
#' create_hist_dens(mtcars$disp, type = "kde", bw = 2)
#' create_hist_dens(iris$Petal.Width, type = "fp")
create_hist_dens <- function(x,
                      type = c("gaussian", "kde", "fp"), # fp is an abbreviation for frequency polygon
                      ...) {

  type <- match.arg(type)

  if(!is.character(type)) stop("type must be a character string")
  if(!(type %in% c("gaussian", "kde", "fp"))) stop("type must be one of \"gaussian\", \"kde\" or \"fp\"")

  if(!is.numeric(x)) stop("the data supplied must be a vector of numeric values") # for histogram

  h <- suppressWarnings(graphics::hist(x, plot = FALSE, ...)) # don't want to return the density histogram yet

  d <- switch(type,
              gaussian = stats::dnorm(x, mean(x), stats::sd(x), ...), # dnorm exists for parametric density
              kde = stats::density(x, ...),
              fp = frequency_polygon(x, ...))

  result <- structure(list(x = x, h = h, d = d, type = type), class = "hist_dens")
  return(result)
}

# We have ensured that e.g. type = "exponential" is not allowed (reflected in test)
# stats is a base package so it does not need to be imported
