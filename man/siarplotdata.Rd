\name{siarplotdata}
\alias{siarplotdata}
\title{ Produces plots of target data and sources }
\description{
    Produces colourful scatter plots of siar target data and sources.
}
\usage{
siarplotdata(siardata, siarversion = 0, grp=1:siardata$numgroups,panel=NULL,isos=c(0,0),leg=1)
}
\details{
  Can be called at any time after running \code{\link{siarloaddata}} or when running \code{\link{siarmenu}}
}
\arguments{
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
  \item{siarversion}{ The siar version number as a string. }
  \item{grp}{A vector containing the groups of target consumer data to be rendered on the graph. Default value NULL draws all groups.
  Groups are identified by their own data marker.}
  \item{panel}{A scalar value that determines if the groups of consumer data are to be drawn on the same graph (default=NULL) or on 
  seperate panels within a single figure. Number of rows and columns of panels can be specified by a 2 element vector. Alternatively,
  giving a single value e.g. panel=1 will cause the program to attempt to fit a "reasonable" number of panels to each row and column.}
  \item{isos}{A two element vector containing the reference to each isotope combination for the x and y axis to be rendered in teh figure.
  Note, only relevant for datasets contianing >2 isotopes. By default, if there are more than two isotopes, seperate figures will be created for 
  all possible combinations of isotopes.}
  \item{leg}{A scalar determining how the legend is to be created. Default leg=1 prompts the user to locate the legend on each figure.
  leg = 2, puts the legend in a new figure automatically (useful if you want to omit the legend but still want to retain access to the 
  information). leg = 0 omits the legend entirely.}
}
\author{ Andrew Parnell and Andrew Jackson}
\keyword{ programming}
\keyword{ models}
