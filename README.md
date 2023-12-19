# densr R package

### Written by Rachel McInerney

## Description

The densr package allows for a particular type of density estimation to be overlayed to a histogram of data. This density type is specified by the user, and can be one of three permitted options: parametric Gaussian density estimation, nonparametric Kernel density estimation or a continuous density estimator called the frequency polygon. 

The package itself does not contain datasets but the functions can be applied to any continuous variable within R built-in data.

In general, \code{fp()} is used to obtain the coordinates of the frequency polygon, should its type be later specified. \code{create_hist_dens()} then intuitively produces an object of class 'hist_dens' for chosen data and a branch of density, on which a plot method for this class is called. The output of the dedicated plotting function can be enhanced using additional arguments to  \code{\link[base]{plot}}, \code{\link[graphics]{curve}} or \code{\link[graphics]{lines}}.

For a more thorough introduction, consult the vignette document above. 




