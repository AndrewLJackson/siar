\name{siar-package}
\alias{siar-package}
\alias{siar}
\docType{package}
\title{
Stable Isotope Analysis in R.
}
\description{
This package takes data on animal isotopes and fits a Bayesian model to their dietary habits based 
upon a Gaussian likelihood with a dirichlet prior mixture on the mean. The main function, siarmcmcdirichletv4(), 
allows the user to specify the data and choose the size of the MCMC run. A wrapper for the package, siarmenu()
gives a walkthrough of all the functions contained in the package and produces some pretty plots. Some
example data on Geese plasma is included for illustration.
}
\details{
\tabular{ll}{
Package: \tab siar\cr
Type: \tab Package\cr
Version: \tab 4.2\cr
Date: \tab 2010-04-22\cr
License: \tab GPL (>= 2)\cr
}
For a demo of how to use the package, type siarmenu() and then choose option 9,
}
\author{
Andrew Parnell <Andrew.Parnell@tcd.ie>
}
\keyword{ multivariate }
\seealso{
\code{\link{siarmenu}} 
\code{\link{siarmcmcdirichletv4}} 
}
\examples{
## See siarmenu()
}
