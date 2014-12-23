\name{overlap}
\alias{overlap}
\title{ Area of overlap between two estimated ellipses }
\description{
  Given the coordinates of two bivariate samples, this function calculates 
  (computationally) the area of overlap between two standard ellipses. 
  Note,  be sure to use a 
  sufficiently low step size when creating the ellipses (i.e. to ensure that 
  there is no excessive discretising of the elliptical shape). As a result of 
  this process, you will inevitably underestimate the true ellipse areas and 
  hence their overlap (although this bias is likely to be inconsequential) if 
  a suitable fine scale is chosen for the step size. There is no single rule for 
  making this choice as it depends on the angle and shape of the ellipse but a 
  step-size of 1 should be more than sufficient in most cases (N.B. the default 
  steps=5). The ellipses calculated are the small sample size corrected standard 
  ellipses.
}
\usage{
overlap(x1,y1,x2,y2,steps = 5) 
}
\arguments{
  \item{x1}{ A vector containing the x coordinates of the first data.}
  \item{y1}{ A vector containing the y coordinates of the first data.}
  \item{x2}{ A vector containing the x coordinates of the second data.}
  \item{y2}{ A vector containing the y coordinates of the second data.}
  \item{steps}{The number of steps in degrees to estimate points on the curve.}
  

}

\value{
  \item{overlap}{The area of overlap between the two standard ellipses.}
  \item{area1}{The area of the first ellipse.}
  \item{area2}{The area of the second ellipse.}
}


\author{ Andrew Jackson }
\keyword{ programming}
