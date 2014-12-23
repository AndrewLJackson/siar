\name{siarmenu}
\alias{siarmenu}
\title{ A list of menu options for running the siar package }
\description{
 Brings up a list of menu options which allow the user to run MCMC and produce some plots
}
\usage{
siarmenu()
}
\author{ Andrew Parnell }
\details{
  The internal workings of this function uses a list called siardata containing some or all of the following parts: 
  targets, sources, corrections, PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, 
  EXIT, and output. Targets, sources and corrections are the isotopic values, source values and fractionation
  correction values respectively. PATH is the path used to get to the files. TITLE is the title to be used on 
  most of the graphs. Numgroups, numdata, numsources and numiso are the number of groups, number of data points,
  number of sources and number of isotopes respectively. SHOULDRUN, GRAPHSONLY and EXIT are used to determine 
  which parts of the menu system can be accessed.
}

\seealso{ \code{\link{siarmcmcdirichletv4}} }
\examples{
#siarmenu()
}
\keyword{ programming }
\keyword{ models }
\keyword{ multivariate }

