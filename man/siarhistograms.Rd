\name{siarhistograms}
\alias{siarhistograms}
\title{ Produce neat siar histograms }
\description{
    Produces neat and colourful histograms for siar output. 
}
\usage{
siarhistograms(siardata, siarversion=0, legloc='topright')
}
\details{
  Not intended for use outside \code{\link{siarmenu}}
}
\arguments{
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
  \item{siarversion}{ The siar version number as a string. }
  \item{legloc}{ The location of the legend - see \code{\link{legend}} for plotting choices.}
}
\author{ Andrew Parnell }
\keyword{ programming}
\keyword{ models}
