\name{concdepdemo}
\alias{concdepdemo}
\docType{data}
\title{ Concentration dependence values for the geese demo data}
\description{
  A 5 column, 4 row matrix containing the mean and standard deviation
  of the concentation dependence values for each of the 2 isotopes used for each different source. Note that the standard deviation is not currently implemened and is set to 0 in this example.
}
\usage{data(concdepdemo)}
\format{
  A data frame with 4 observations on the following 5 variables.
  \describe{
    \item{\code{Sources}}{The source name. }
    \item{\code{Meand15N}}{The mean concentration dependence value for 15N}
    \item{\code{SDd15N}}{The standard deviation concentration dependence value for 15N}
    \item{\code{Meand13C}}{The mean concentration dependence value for 13C}
    \item{\code{SDd13C}}{The standard deviation concentration dependence value for 13C}
  }
}
\examples{
#see siarmenu() and option 9 for a demo using this data
}
\keyword{datasets}

