# SIAR v4.2.1
Stable Isotope Analysis in R - package
Parnell, A.C., Inger R., Bearhop, S. & Jackson, A.L. 2010. Source partioning using stable isotopes: coping with too much variation. PLoS ONE, 5(3), e9672 . [doi](http://dx.doi.org/10.1371/journal.pone.0009672)

Version 4.2.1 fixes:
* bug in SIBER routines in Linux distirubutions on call to bayesm:rmultireg via siar:bayesMVN that was spotted by https://github.com/lsaravia
* siardensityplot()'s main="my awesome graph" argument now works.
* linewidths in all *.Rd files now within 90 char limit for pdf creation.
* cleaned up some instances of quartz() calls that are not used in any case.

## Installing SIAR

You can install directly from GitHub if you have the devtools package installed:

	library(devtools)
	install_github("andrewljackson/siar")
	library(siar)
	
## Tutorials, help and assistance
There is a range of materials available for getting started with SIAR with links to example files, video podcasts, tutorials etc... available from http://www.tcd.ie/Zoology/research/research/theoretical/siar.php. There are also more files and examples at https://github.com/AndrewLJackson/SIAR-examples-and-queries and i will consolidate these various files into this git repo and/or accompanying git website at some point in the future. Note also that I am currently working on a major update to SIBER which will see it removed from the SIAR package at some point https://github.com/AndrewLJackson/SIBER-sandbox. 

## Acknowledgments
Thanks to Natalie Cooper for help with Github installation instructions and general Git advice!
