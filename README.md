# SIAR v4.2.2.9000
Stable Isotope Analysis in R - package

[![cran version](http://www.r-pkg.org/badges/version/siar)](http://cran.rstudio.com/web/packages/siar) 
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/siar?)](https://github.com/metacran/cranlogs.app)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/siar?color=82b4e8)](https://github.com/metacran/cranlogs.app)
[![DOI](https://zenodo.org/badge/28399807.svg)](https://zenodo.org/badge/latestdoi/28399807)

Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](http://dx.doi.org/10.1371/journal.pone.0009672)

Development version 4.2.2.9000 Hotfix 28-March-2017
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

You can install directly from GitHub if you have the devtools package installed:
```R
	library(devtools)
	install_github("andrewljackson/siar@master", build_vingettes == TRUE)
	library(siar)
```
## Tutorials, help and assistance
There is a range of materials available for getting started with SIAR with links to example files, video podcasts, tutorials etc... available from http://www.tcd.ie/Zoology/research/research/theoretical/siar.php. There are also more files and examples at https://github.com/AndrewLJackson/SIAR-examples-and-queries and i will consolidate these various files into this git repo and/or accompanying git website at some point in the future. Note also that I am currently working on a major update to SIBER which will see it removed from the SIAR package at some point https://github.com/AndrewLJackson/SIBER-sandbox. 

## Acknowledgments
Thanks to [Natalie Cooper](https://github.com/nhcooper123) for help with Github installation instructions and general Git advice!

##Publications

Jackson, A.L., Parnell, A.C., Inger R., & Bearhop, S. 2011. Comparing isotopic niche widths among and within communities: SIBER – Stable Isotope Bayesian Ellipses in R. Journal of Animal Ecology, 80, 595-602. [doi](http://dx.doi.org/10.1111/j.1365-2656.2011.01806.x)

Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](http://dx.doi.org/10.1371/journal.pone.0009672)
