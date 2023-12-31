#' densr
#'
#' A package to overlay a histogram with different types of density estimation methods on a numeric data set.
#'
#'
#' @param lib Path to the library which the package is installed into
#' @param pkg Name of the package
#'
#' @section Details:
#' \describe{
#' \item{Type: }{Package}
#' \item{Package: }{densr}
#' \item{Version: }{0.1.0}
#' \item{Date: }{2024-01-04}
#' }
#'
#' @section Usage:
#' Package contains three functions which are to be used in conjunction.
#' These are \code{link{frequency_polygon}}, for creating a frequency polygon
#' type density estimation, \code{link{create_hist_dens}}, to create an object
#' of class \code{"hist_dens"}, \code{link{plot.hist_dens}}, a dedicated plotting function
#' is used to plot objects of class \code{"hist_dens"}
#'
#' @author Rachel McInerney - <\email{rachel.mcinerney.2021@@mumail.ie}>
#'         Conor Thompson - <\email{conor.thompsongargan.2020@@mumail.ie}>
#'         Osi Ukachukwu - <\email{osi.ukachukwu.2018@@mumail.ie}>
#'
#' @docType package
#' @keywords package
#'
#' @examples NULL
"_PACKAGE"

.onAttach <- function(lib, pkg) {
  path    <- file.path(lib, pkg, "DESCRIPTION")
  version <- read.dcf(path, "Version")
  name    <- read.dcf(path, "Package")
  if(interactive()) {
    packageStartupMessage(paste("\n    ____  _______   _______ ____ \n   / __ \\/ ____/ | / / ___// __ \\\t Density Overlay\n  / / / / __/ /  |/ /\\__ \\/ /_/ /\t to\n / /_/ / /___/ /|  /___/ / _, _/\t Histograms\n/_____/_____/_/ |_//____/_/ |_|\t  version", version, "\n"))
    } else   {
    packageStartupMessage("\nPackage ", sQuote(name), " version ", version, ".\n")
  }
    packageStartupMessage(paste(" Visit https://github.com/rachel-mc/densr.git for documentation and examples.\n Type", sQuote("?densr"), "for a brief guide on how to use this package.\n Please cite densr in your work using:", sQuote(paste0("citation(", dQuote(name),")"))))
}
