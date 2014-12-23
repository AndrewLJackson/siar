\name{bayesMVN}
\alias{bayesMVN}
\title{Bayesian MVN}
\description{
  Fit a Multivariate Normal distribution to bivariate data using Bayesian
   Inference. Uses the function \code{\link{rmultireg}} to fit the model to the data.
}
\usage{
bayesMVN(x,y,R=10^4)
}
\arguments{
  \item{x}{ A vector containing the x coordinates of the data.}
  \item{y}{ A vector containing the y coordinates of the data.}
  \item{R}{ The number of posterior draws to make. Defaults to 10^4.}
  

}

\value{
  \item{b}{The posterior draws of the estimated means.}
  \item{S}{The posterior draws of the estimated correlation matrix sigma.}
}


\author{ Andrew Jackson }
\keyword{ programming}
