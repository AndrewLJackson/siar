\name{siber.ellipses}
\alias{siber.ellipses}
\title{ The SIBER method for calculating ellipse based metrics of niche width}
\description{
  Takes bivariate isotope data in x and y with a grouping variable and returns
  the posterior draws for the metric SEA.B for each group.
}
\usage{
  siber.ellipses(x,y,group,R=10^4)
}
\arguments{
  \item{x}{ Data for the x-axis.}
  \item{y}{ Data for the y-axis.}
  \item{group}{ A grouping variable}
  \item{R}{ The number of posterior draws to make}

}

\value{
  \item{SEA.B}{A matrix containing the posterior estimate of the Standard 
  Ellipse Area metric for each group by column.}
}
\author{ Andrew Jackson }
\keyword{ programming}
