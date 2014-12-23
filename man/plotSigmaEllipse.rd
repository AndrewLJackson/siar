\name{plotSigmaEllipse}
\alias{plotSigmaEllipse}
\title{Plot an ellipse based on a correlation matrix }
\description{
  A utility function for quickly adding an ellipse to an existing graph based 
  on a correlation matrix defining the ellipse's parameters.
}
\usage{
plotSigmaEllipse(m,sigma,steps=5,col="black",lwd=1,lty=2)
}
\arguments{
  \item{m}{ A vector of length 2 containing the centres of the ellipse (i.e. the means of the ellipse).}
  \item{sigma}{ A 2x2 matrix representing the correlation matrix that defines the ellipse.}
  \item{steps}{ A visual rendering option that sets the number of step-size and 
  hence resolution of the points used to draw the lines defining the ellipses. 
  The larger the value, the more angular the ellipses will appear.}
  \item{col}{ The colour to use in the plot see \code{\link{par}}.}
  \item{lty}{ The line type to use in the plot see \code{\link{par}}.}
  \item{lwd}{ The line width to use in the plot see \code{\link{par}}.}
  

}



\author{ Andrew Jackson }
\keyword{ programming}
