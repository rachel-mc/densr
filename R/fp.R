# Function 1: Frequency Polygon (abbreviation fp)

# Adapt code from the notes into a function
# Pull out components of histogram object

# Estimate the density at locations excluding midpoints by linearly interpolating between adjacent bar heights

fp <- function(x, ...) {
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
fp(mtcars$mpg)
