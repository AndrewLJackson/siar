\name{bayestwoNorm}
\alias{bayestwoNorm}
\title{ Bayesian Independent Normal Distributions }
\description{
  Fit two independent Normal distributions to bivariate data using Bayesian
   Inference. Uses the function \code{\link{runireg}} to fit the model to the data.
}
\usage{
bayestwoNorm(xx,yy,R=10^4)
}
\arguments{
  \item{xx}{ A vector containing the x coordinates of the data.}
  \item{yy}{ A vector containing the y coordinates of the data.}
  \item{R}{ The number of posterior draws to make. Defaults to 10^4.}
  

}

\value{
  \item{b}{The posterior draws of the estimated independent means.}
  \item{S}{The posterior draws of the estimated independent variances.}
}


\author{ Andrew Jackson }
\keyword{ programming}
