\name{siarelicit}
\alias{siarelicit}
\title{ Elicit prior parameters for the Dirichlet distribution. }
\description{
  Allows users to enter mean estimated proportions and a standard deviation term so that useful prior distributions
  can be enterred into the \code{\link{siarmcmcdirichletv4}} function.
}
\usage{
siarelicit(siardata)
}
\arguments{
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
}
\details{
  Uses standard results from the Dirichlet distibution to turn the estimated mean proportions \eqn{M_I}{M[i]} and a 
  variance term \eqn{V_1}{V[1]} to give the estimated parameters \eqn{a_i}{a[i]} via: 
  \deqn{a_i = M_i \left( \frac{M_1 (1-M_1)}{V_1} - 1 \right)}{a[i] = M[i] ( (M[1] (1-M[1]))/V[1] - 1 )}
  Note that \eqn{V} can be given for any of the \eqn{k} sources.
}
\author{ Andrew Parnell }
\keyword{ programming}
\keyword{ models}
