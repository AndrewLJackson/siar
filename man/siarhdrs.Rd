\name{siarhdrs}
\alias{siarhdrs}
\title{ Creates hdrs and convergence diagnostics from siar output }
\description{
  Creates highest density regions and convergence diagnostics from siar output.
  Accessed by the siar menu function and not really intended for use outside that environment
}
\usage{
siarhdrs(siardata)
}
\arguments{
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
}
\details{
  Not intended for use outside \code{\link{siarmenu}}
}
\author{ Andrew Parnell }
\keyword{ programming}
\keyword{ models}
