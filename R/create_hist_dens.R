# Function 2: Create object of hist_dens

# Takes data x and type of density estimation (options) as input
# Default is first argument in the character string (parametric)
# Use switch() instead of nested if statements for efficiency and speed
# Returns the histogram and data as an object of class hist_dens
# Don't want to return histogram yet, only aforementioned attributes

# Don't need to write a function for the parametric (normal) density estimation
# stats is a base package so it does not need to be imported

# d contains the density information from the type specified by the user (or default otherwise)

# For ROxygen documentation:
@seealso See \code{\link[stats]{density}} for a complete list of arguments that can be passed when \code{type = "kde"}

create_hist_dens <- function(x,
                      type = c("gaussian", "kde", "fp"),
                      ...) {
  type <- match.arg(type)
  h <- hist(x, , plot = FALSE, ...)
  d <- switch(type,
              gaussian = stats::dnorm(x, mean(x), sd(x), ...),
              kde = stats::density(x, ...),
              fp = fp(x, ...))
  result <- list(h=h, d=d)
  class(result) <- "hist_dens"
  return(result)
}

# Quick check
create_hist_dens(mtcars$mpg)
