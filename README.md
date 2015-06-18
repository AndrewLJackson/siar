# SIAR v4.2.1
Stable Isotope Analysis in R - package

Version 4.2.1 fixes:
*bug in SIBER routines in Linux distirubutions on call to bayesm:rmultireg via siar:bayesMVN that was spotted by https://github.com/lsaravia
*siardensityplot()'s main="my awesome graph" argument now works.
*linewidths in all *.Rd files now within 90 char limit for pdf creation.
*cleaned up some instances of quartz() calls that are not used in any case.

## Installing SIAR

You can install directly from GitHub if you have the devtools package installed:

	library(devtools)
	install_github("andrewljackson/siar")
	library(siar)
	
## Acknowledgments
Thanks to Natalie Cooper for help with Github installation instructions and general Git advice!
