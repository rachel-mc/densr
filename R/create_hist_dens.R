# Function 2: Class Constructor Function

# Create object of class hist_dens

# Takes data x and type of density estimation (options listed) as input
# Default is the first argument in the character string (gaussian)
# Can have additional kde specific arguments
# Use switch() instead of nested if statements for efficiency and speed
# Returns the histogram, data and type of density used as an object of class hist_dens
# Save histogram to use inside the plot function later

# Ellipses: argument to outer function can be passed through to inner functions

# Don't need to write a function for the parametric density estimation as dnorm exists
# stats is a base package so it does not need to be imported

# d contains the density information from the type specified by the user (or default otherwise)

# Vignette: returns object that contains ..., plot method exists for this type, 2 main functions etc.

# For ROxygen documentation:
#@seealso See \code{\link[stats]{density}} for a complete list of arguments that can be passed when \code{type = "kde"}

create_hist_dens <- function(x,
                      type = c("gaussian", "kde", "fp"),
                      ...) {
  type <- match.arg(type)
  h <- graphics::hist(x, plot = FALSE, ...) # don't want to return the histogram yet
  d <- switch(type,
              gaussian = stats::dnorm(x, mean(x), sd(x), ...),
              kde = stats::density(x, ...),
              fp = fp(x, ...))
  result <- list(h=h, d=d, type = type)
  class(result) <- "hist_dens"
  return(result)
}

# Quick check
create_hist_dens(mtcars$mpg)
