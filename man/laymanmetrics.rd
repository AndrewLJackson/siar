\name{laymanmetrics}
\alias{laymanmetrics}
\title{ Isotope-space Niche Width Metrics}
\description{
  Calculates the 6 metrics for trophic niche width as described by
  Layman et al. 2007.
}
\usage{
laymanmetrics(x,y)
}
\arguments{
  \item{x,y}{ Bivariate data given as vectors x and y }
}

\value{
  \item{dN_range}{Assuming y is delta Nitrogen, then dN_range is the max(delta N} - min(delta N)
  \item{dC_range}{Assuming x is delta Nitrogen, then dN_range is the max(delta N} - min(delta N)
  \item{hull}{Contains the area of the convex hull around the data points
  defined by x and y (hull$TA); the coordinates for plotting of the convex
  hull (hull$xcoords, hull$ycoords); and the index address of the points in
  x and y which define the convex hull (hull$chI)}
  \item{CD}{Mean distance to centroid}
  \item{MNND}{Mean Nearest Neighbour Distance}
  \item{SDNND}{Standard Deviation of the Nearest Neighbour Distance}
}

\references{
     Layman, C. A., D. A. Arrington, et al. (2007).
     Can stable isotope ratios provide for community-wide measures
     of trophic structure? Ecology 88(1): 42-48.

}

\author{ Andrew Jackson }
\keyword{ programming }