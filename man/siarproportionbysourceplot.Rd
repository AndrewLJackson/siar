\name{siarproportionbysourceplot}
\alias{siarproportionbysourceplot}
\title{ siar proportion plots by source }
\description{
  Useful for siar data with multiple groups where the variability of each source over time is of interest.
}
\usage{
siarproportionbysourceplot(siardata, siarversion=0,probs=c(95,75,50),xlabels=NULL, grp=NULL, type="boxes",clr=gray((9:1)/10),scl=1,xspc=0,prn=FALSE,leg=FALSE)
}
\arguments{
  \item{siardata}{ A list containing some or all of the following parts: targets, sources, corrections,
  PATH, TITLE, numgroups, numdata, numsources, numiso, SHOULDRUN, GRAPHSONLY, EXIT, and output. For more details
  of these inputs see the \code{\link{siarmenu}} function. }
  \item{siarversion}{ The siar version number. }
  \item{probs}{ Define the extent probability intervals for a given parameter.}
  \item{xlabels}{ Specifies the text to associate with each group defined as ticks on the x-axis.}
  \item{grp}{ Specifies which source group the graph is drawn for. Default prompts the user for input from the command line.}
  \item{type}{ Determines the style of graph. type="boxes" draws boxplot style (default), type="lines" draws overlain lines increasing in thickness}
  \item{clr}{	Determines the set of colours to use for the boxes. Default is greyscale.}
  \item{scl}{ Specifies a proportional scaling factor to increase (scl > 1) or decrease (scl < 1) the default width of lines or boxes. Default = 1.}
  \item{xspc}{ Sets the amount of blank space either side of the first and last (on the x-axis) graphic object.}
  \item{prn}{ If prn=TRUE the values for the defined probability densities (probs) are returned to the command window. Default is prn=FALSE with no such output.}
  \item{leg}{ Determines whether a legend is to be drawn (leg=TRUE) or not (default leg=FALSE). Note, currently only supported for type="lines".}

}
\author{ Andrew Parnell }
\keyword{ programming}
