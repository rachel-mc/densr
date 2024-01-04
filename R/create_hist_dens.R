# Function 2: Class Constructor Function

# Create object of class hist_dens

# Takes data x and type of density estimation (options listed) as input
# Default is the first argument in the character string (gaussian)
# Can have additional kde specific arguments
# Use switch() instead of nested if statements for efficiency and speed
# Returns the histogram, data and type of density used as an object of class hist_dens
# Save histogram to use inside the plot function later

# match.arg() checks whether the supplied type is one of the available options, otherwise it will return an error
# We have ensured that e.g. type = "exponential" is not allowed (reflected in test)

# Ellipses: argument to outer function can be passed through to inner functions

# Don't need to write a function for the parametric density estimation as dnorm exists
# stats is a base package so it does not need to be imported

# d contains the density information from the type specified by the user (or default otherwise)
# create_hist_dens(x) will be equivalent to create_hist_dens(x, type = "gaussian") by default

# Vignette: returns object that contains ..., plot method exists for this type, 2 main functions etc.

# For ROxygen documentation:
#@seealso See \code{\link[stats]{density}} for a complete list of arguments that can be passed when \code{type = "kde"}

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

# Quickly test the function
create_hist_dens(mtcars$mpg)

# the data 'x' must be numeric
