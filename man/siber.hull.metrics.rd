\name{siber.hull.metrics}
\alias{siber.hull.metrics}
\title{ The SIBER method for calculating Convex Hull based metrics of niche width}
\description{
  Takes bivariate isotope data in x and y with a grouping variable and returns
  a list that contains the posterior distribution of the 6 niche width 
  metrics for application to community type data
  described by Layman, C.A., Arrington, D.A., Montana, C.G., & Post, D.M.
   (2007) Can stable isotope ratios provide for community-wide measures 
   of trophic structure? Ecology, 88, 42-48.
}
\usage{
siber.hull.metrics(X,Y,G,R=10^4)
}
\arguments{
  \item{X}{ Data for the x-axis.}
  \item{Y}{ Data for the y-axis.}
  \item{G}{ A grouping variable}
  \item{R}{ The number of posterior draws to make}

}

\value{
  \item{metrics}{A Rx6 matrix containing the R posterior draws in rows, and the
   metrics in columns in the order: dNr, dCr, TA, CD, MNND, SDNND.}
}
\author{ Andrew Jackson }
\keyword{ programming}
