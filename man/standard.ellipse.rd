\name{standard.ellipse}
\alias{standard.ellipse}
\title{ Standard Ellipse }
\description{
  Fits a standard ellipse to bivariate data analytically using maximum 
  likelihood estimators.
}
\usage{
standard.ellipse(x,y,confs=NULL,steps=5)
}
\arguments{
  \item{x}{ Vector of x data.}
  \item{y}{ Vector of y data.}
  \item{confs}{ Optional list of confidence intervals as a vector. 
  If specified will calculate the confidence intervals of the means and store 
  their coordinates in a list (useful for plotting). Defaults to Null.}
  \item{steps}{ A visual rendering option that sets the number of step-size and 
  hence resolution of the points used to draw the lines defining the ellipses. 
  The larger the value, the more angular the ellipses will appear.}

}

\value{
  \item{CEA}{The area of the 95 percent confidence ellipse.}
  \item{SEA}{The area of the standard ellipse.}
  \item{SEAc}{The area of the small sample size corrected standard ellipse.}
  \item{theta}{The angle of the semi-major axis of the ellipse with the x-axis.}
  \item{confs}{list of the confidence intervals of the mean, if speficied.}
  \item{xCEA}{x coordinates of the confidence ellipses.}
  \item{yCEA}{y coordinates of the confidence ellipses.}
  \item{xSEA}{x coordinates of the standard ellipse.}
  \item{ySEA}{y coordinates of the standard ellipse.}
  \item{xSEAc}{x coordinates of the small sample size corrected standard ellipse.}
  \item{ySEAc}{y coordinates of the small sample size corrected standard ellipse.}
  \item{eccentricity}{Eccentricity of the ellipse}
  \item{a}{The length of the semi-major axis a}
  \item{b}{The length of the semi-minor axis a}
  \item{r}{The correlation coefficient of the data}
  \item{ac}{The length of the semi-major axis a based on the small sample size correction.}
  \item{bc}{The length of the semi-minor axis b based on the small sample size correction.}
}



\author{ Andrew Jackson }
\keyword{ programming}
