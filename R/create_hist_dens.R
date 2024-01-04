# Function 2: Class Constructor Function
# Sets up objects of class hist_dens properly, only contain what is allowed
# Good class constructor functions provide checks and intelligible error/warning messages in the event that instances of a class don't satisfy the requirements of the class

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

  if(missing(type)) {
    warning("no value specified for 'type'; the default type \"gaussian\" is used")
    type = "gaussian"
    } # missing tests whether a value was specified as an argument to a function
  if(length(type) > 1) {
    warning(paste0("only first element of the type vector used:\ntype = \"",
                                         type[1], "\""))
    type <- type[1]
  }
  if(!is.character(type)) stop("type must be a character string")
  if(!(type %in% c("gaussian", "kde", "fp"))) stop("type must be one of \"gaussian\", \"kde\" or \"fp\"")

  type <- match.arg(type)

  h <- suppressWarnings(graphics::hist(x, plot = FALSE, ...)) # don't want to return the density histogram yet
  d <- switch(type,
              gaussian = stats::dnorm(x, mean(x), stats::sd(x), ...),
              kde = stats::density(x, ...),
              fp = frequency_polygon(x, ...))
  result <- structure(list(h = h, d = d, type = type), class = "hist_dens")
  return(result)
}

# Quickly test the function
create_hist_dens(mtcars$mpg)
create_hist_dens(mtcars$mpg, type = "gaussian")
create_hist_dens(mtcars$mpg, type = "kde")
create_hist_dens(mtcars$mpg, type = "fp")
create_hist_dens(mtcars$mpg, type = 2)
create_hist_dens(mtcars$mpg, type = "rachel")
create_hist_dens(mtcars$mpg, type = c("fp", "kde"))

# the data 'x' must be numeric
