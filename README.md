# SIAR v4.2.2
Stable Isotope Analysis in R - package

Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](http://dx.doi.org/10.1371/journal.pone.0009672)

Version 4.2.1 fixes:
* bug in SIBER routines in Linux distirubutions on call to bayesm:rmultireg via siar:bayesMVN that was spotted by https://github.com/lsaravia
* siardensityplot()'s main="my awesome graph" argument now works.
* linewidths in all *.Rd files now within 90 char limit for pdf creation.
* cleaned up some instances of quartz() calls that are not used in any case.

Version 4.2.2 fixes:
* bug in call to .C() for the single group of consumer data arising due to 
dataframe not being automatically coerced to double format. The coersion is now
as.double(as.matrix(some.data)).

## Installing SIAR

You can install directly from GitHub if you have the devtools package installed:

	library(devtools)
	install_github("andrewljackson/siar")
	library(siar)
	
## Tutorials, help and assistance
There is a range of materials available for getting started with SIAR with links to example files, video podcasts, tutorials etc... available from http://www.tcd.ie/Zoology/research/research/theoretical/siar.php. There are also more files and examples at https://github.com/AndrewLJackson/SIAR-examples-and-queries and i will consolidate these various files into this git repo and/or accompanying git website at some point in the future. Note also that I am currently working on a major update to SIBER which will see it removed from the SIAR package at some point https://github.com/AndrewLJackson/SIBER-sandbox. 

## Acknowledgments
Thanks to [Natalie Cooper](https://github.com/nhcooper123) for help with Github installation instructions and general Git advice!
=======
SIAR - Stable Isotope Analysis in R
====

This package currently includes a mixing model, an ellipse based metric for population-level niche width and of community-level niche width all underpinned by Bayesian Inference.

See also the related package [MixSIAR](https://github.com/brianstock/MixSIAR) and the development of the standalone ellipse and convex hull estimates of niche with at [SIBER](https://github.com/andrewljackson/siber)

## Installation Instructions
N.B. the package siar is likely to be removed from CRAN in early 2015 owing to a change in how package dependencies need to be handled within siar. There are a few other minor, mostly stylistic issues that CRAN have identified that need to be dealt with. However, with only 2 weeks notice given to us on 21.12.2014, and with christmas holidays in fully swing, its unlikely we will be able to fixe them. In the meantime, the source files are still available here, and can be installed directly from github as instructed below.
* the latest released version: `install.packages("siar")`
* the latest development version: `install_github("AndrewLJackson/siar")`

##Publications

Jackson, A.L., Parnell, A.C., Inger R., & Bearhop, S. 2011. Comparing isotopic niche widths among and within communities: SIBER – Stable Isotope Bayesian Ellipses in R. Journal of Animal Ecology, 80, 595-602. [doi](http://dx.doi.org/10.1111/j.1365-2656.2011.01806.x)

Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](http://dx.doi.org/10.1371/journal.pone.0009672)
