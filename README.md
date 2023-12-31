# densr R package

### Written by Rachel McInerney

## Description

The __densr__ package allows for a particular type of density estimation to be overlayed to a histogram of data. This density type is specified by the user, and can be one of three permitted options: parametric Gaussian density estimation, nonparametric Kernel density estimation or a continuous density estimator called the frequency polygon. 

The package itself does not contain datasets but the functions can be applied to any continuous variable within R built-in data.

In general, `frequency_polygon` is used to obtain the coordinates of the frequency polygon density estimate, should its type be later specified. `create_hist_dens` then intuitively produces an object of class 'hist_dens' for chosen data and a branch of density, on which a `plot` method for this class is called. The output of the dedicated plotting function can be enhanced using additional arguments to the inner base R function `plot` or the constituent functions `curve` and `lines` from the _graphics_ package.

## Installation 

You can install the `densr` package from GitHub, using:

```
# If required install devtools:  
# install.packages('devtools')  
devtools::install_github('rachel-mc/densr')
```
To access the built vignette document for a more thorough introduction, use the code:

```
devtools::install_github('rachel-mc/densr', build_vignettes = TRUE)
```





