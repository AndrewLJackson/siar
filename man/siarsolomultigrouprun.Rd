\name{siarsolomultigrouprun}
\alias{siarsolomultigrouprun}
\title{ siar MCMC for multi-group data with only one target organism per group}
\description{
  Runs the siar MCMC with Dirichlet mixture mean for isotopic data with only one target organism per group.
}
\usage{
siarsolomultigrouprun(siardata)
}
\arguments{
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
}
\author{ Andrew Parnell }
\keyword{ programming}
\keyword{ models}
