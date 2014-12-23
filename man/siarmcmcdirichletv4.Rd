\name{siarmcmcdirichletv4}
\alias{siarmcmcdirichletv4}
\title{ MCMC for stable isotope data }
\description{
  Runs an MCMC on stable isotope data from certain organisms to determine their dietary habits.
}
\usage{
siarmcmcdirichletv4(data, sources, corrections = 0, concdep = 0, iterations=200000, burnin=50000, howmany=10000, thinby=15, prior = rep(1, nrow(sources)), siardata=list(SHOULDRUN=FALSE))
}
\arguments{
   \item{data}{ A matrix with each food source as a seperate row and each isotope as a seperate column.}
  \item{sources}{ A matrix containing the mean and standard deviations of the fractionated correction 
  values for each of the isotopes. Also allows corrections = 0 for pre-corrected data. }
  \item{corrections}{ A matrix containing the mean and standard deviations of the fractional correction
  values for each of the isotopes. Also allows corrections = 0 for pre-corrected data.}
  \item{concdep}{ A matrix containing the mean and standard deviations of the concentration dependence
  values for each of the isotopes. Also allows concdep = 0 for data with no required concentration dependence. Note that 
  version 4.0 does not use the standard deviations.}
  \item{iterations}{ The number of iterations to run. }
  \item{burnin}{ The size of the burnin }
  \item{howmany}{ How often to report the number of iterations. }
  \item{thinby}{ The amount of thinning of the iterations. }
  \item{prior}{ The dirichlet distribution prior parameters, the default is rep(1,numsources). New parameters
  can be estimated via the function \code{\link{siarelicit}}.}
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
}
\details{
  The model assumes that each target value comes from a Gaussian distribution with an unknown mean and standard 
  deviation. The structure of the mean is a weighted combination of the food sources' isotopic 
  values. The weights are made up dietary proportions (which are given a Dirichlet prior distribution) and the
  concentration depdendencies given for the different food sources. The 
  standard deviation is divided up between the uncertainty around the fractionation corrections (if 
  corrections are given) and the natural variability between target individuals within a defined group 
  (or between all individuals if no grouping structure is specified). The default iterations numbers work well 
  for the demo data sets, but advanced users will want to adjust them to suit their analysis. 
}
\value{
  A parameter matrix consisting of (iterations-burnin)/thinby rows with numgroups*(numsources+numiso) 
  columns, where numsources is the number of food sources, numiso is the number of isotopes, and numgroups 
  is the number of groups. The parameter matrix is structured so that, for each group, the first columns 
  are those of the proportions of each food source eaten, the next columns are the standard deviations for 
  each isotope. This format repeats across rows to each group. The parameters may then subsequently be 
  used for plotting, convergence checks, summaries, etc, etc.
}
\author{ Andrew Parnell }
\seealso{ \code{\link{siarmenu}}, \code{\link{siarelicit}} }
\examples{
# Should take around 10 seconds to run
#out <- siarmcmcdirichletv4(geese1demo,sourcesdemo,correctionsdemo,concdepdemo)
}
\keyword{ programming }
\keyword{ models }
\keyword{ multivariate }
