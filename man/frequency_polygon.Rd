% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frequency_polygon.R
\name{frequency_polygon}
\alias{frequency_polygon}
\title{Frequency Polygon}
\usage{
frequency_polygon(x, ...)
}
\arguments{
\item{x}{A numeric vector of data}

\item{...}{Additional arguments to be passed to the \code{hist} function}
}
\value{
An object of class \code{list} containing coordinates for plotting
the frequency polygon. The midpoints of the density histogram are represented by the
x-coordinates (\code{vx}), and the corresponding density values (heights of the bars)
are represented by the y-coordinates (\code{vy})
}
\description{
Calculates the required coordinates to plot the frequency polygon density estimate.
}
\details{
This function estimates this density at locations excluding the midpoints by linearly
interpolating between adjacent bar heights. The relevant components are extracted
from the histogram object created from the data.
}
\examples{
fp <- frequency_polygon(x = mtcars$mpg)

}
\seealso{
\code{\link{hist}}

Other densr: 
\code{\link{create_hist_dens}()},
\code{\link{plot.hist_dens}()}
}
\author{
Rachel McInerney - <\email{rachel.mcinerney.2021@mumail.ie}>
        Conor Thompson - <\email{conor.thompsongargan.2020@mumail.ie}>
        Osi Ukachukwu - <\email{osi.ukachukwu.2018@mumail.ie}>
}
\concept{densr}
