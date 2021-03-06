# SIAR v4.2.4.XXXX
Stable Isotope Analysis in R - package

**_DO NOT USE THIS PACKAGE SIAR!!!!_**

* **IMPORTANT:** SIAR is now defunct (dead, gone, over). 
    * Please use the packages [SIBER](https://github.com/AndrewLJackson/SIBER) for fitting of ellipses and convex hulls.
    * Please use the package [MixSIAR](https://github.com/brianstock/MixSIAR) for fitting mixing models which offers the latest suite of options for including linear covariates and hierarchical random effects among other new developments. You may also use the package [simmr](https://github.com/andrewcparnell/simmr) for fitting simple or lite versions of mixing models.

[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/siar?)](https://github.com/metacran/cranlogs.app)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/siar?color=82b4e8)](https://github.com/metacran/cranlogs.app)
[![DOI](https://zenodo.org/badge/28399807.svg)](https://zenodo.org/badge/latestdoi/28399807)

Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](https://doi.org/10.1371/journal.pone.0009672)

Version 4.2.4.XXXXX
* SIAR is now defunct. 
    * Please use the packages [SIBER](https://github.com/AndrewLJackson/SIBER) for fitting of ellipses and convex hulls.
    * Please use the package [MixSIAR](https://github.com/brianstock/MixSIAR) for fitting mixing models which offers the latest suite of options for including linear covariates and hierarchical random effects among other new developments. You may also use the package [simmr](https://github.com/andrewcparnell/simmr) for fitting simple or lite versions of mixing models.

Version 4.2.4
* add 'color.src' argument (with 20 different colors set as default) to 'siarplotdatawrapper' and 'siarplotdata' functions, while user can set the colors for source items by themselves. 
* changed the output in 'siarhdrs' function from c("Low 95% hdr","High 95% hdr","mode","mean") to c("Mean", "SD", "2.5%", "5%", "25%", "50%", "75%", "95%", "97.5%") as default .
* add Return value for 'siarhdrs' function. 

Version 4.2.3 20-February-2018
* bugs from 4.2.2.9000 incorporated.
* bugs on labelling of credible intervals output by `siarproportionbysourceplot` and `siarproportionbygroupplot` fixed.

Version 4.2.2.9000 Hotfix 28-March-2017
* update to to the package `spatstat` broke siar. This is swapped to `spatstat.utils` in a hotfix on the master branch.

Version 4.2.2 fixes:
* bug in call to .C() for the single group of consumer data arising due to 
dataframe not being automatically coerced to double format. The coersion is now
as.double(as.matrix(some.data)). This addresses the message `error: not a matrix`

Version 4.2.1 fixes:
* bug in SIBER routines in Linux distirubutions on call to bayesm:rmultireg via siar:bayesMVN that was spotted by https://github.com/lsaravia
* siardensityplot()'s main="my awesome graph" argument now works.
* linewidths in all *.Rd files now within 90 char limit for pdf creation.
* cleaned up some instances of quartz() calls that are not used in any case.


## Installing SIAR

You can install directly from GitHub if you have the devtools package installed. But you really shouldn't. This package is no longer supported, nor encouraged, and it is only 
```R
	library(devtools)
	install_github("andrewljackson/siar@master", build_vingettes = TRUE)
	library(siar)
```

## Tutorials, help and assistance
There is a range of materials available for getting started with SIAR with links to example files, video podcasts, tutorials etc... available from http://www.tcd.ie/Zoology/research/groups/jackson/projects/siar.php. There are also more files and examples at https://github.com/AndrewLJackson/SIAR-examples-and-queries and i will consolidate these various files into this git repo and/or accompanying git website at some point in the future. Note also that I am currently working on a major update to SIBER which will see it removed from the SIAR package at some point https://github.com/AndrewLJackson/SIBER-sandbox. 

## Acknowledgments
Thanks to [Natalie Cooper](https://github.com/nhcooper123) for help with Github installation instructions and general Git advice!

## Publications

Jackson, A.L., Parnell, A.C., Inger R., & Bearhop, S. 2011. Comparing isotopic niche widths among and within communities: SIBER – Stable Isotope Bayesian Ellipses in R. Journal of Animal Ecology, 80, 595-602. [doi](https://doi.org/10.1111/j.1365-2656.2011.01806.x)

Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](https://doi.org/10.1371/journal.pone.0009672)
