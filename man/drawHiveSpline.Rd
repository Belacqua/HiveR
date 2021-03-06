\name{drawHiveSpline}
\alias{drawHiveSpline}
\title{
Draw a 3D spline as part of a 3D hive plot
}
\description{
This function analyzes the edges of a \code{HivePlotData} object in order to draw 3D splines representing those edges.  Each pair of nodes at the ends of an edge is identified, and a control point is computed.  This information is passed to \code{\link{rcsr}} to work out the details.
}
\usage{
drawHiveSpline(HPD, L_A = FALSE, ...)
}
\arguments{
  \item{HPD}{
An object of S3 class \code{HivePlotData}.
}
  \item{L_A}{
Logical: should splines be drawn with \code{line_antialias = TRUE}?
}

  \item{\dots}{
Parameters to be passed downstream.
}
}
\value{
None.  A spline is added to the 3D hive plot in progress.
}
\seealso{
\code{\link{plot3dHive}} which calls this function and is the user interface.
}
\references{
\url{http://academic.depauw.edu/~hanson/HiveR/HiveR.html}
}
\author{
Bryan A. Hanson, DePauw University. \email{hanson@depauw.edu}
}
\keyword{ plot }
\keyword{ hplot }
