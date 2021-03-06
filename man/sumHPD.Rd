\name{sumHPD}
\alias{sumHPD}
\title{
Summarize a hive plot data object and optionally run some checks
}
\description{
This function summarizes a \code{\link{HivePlotData}} object in a convenient form. Optionally, it can run some checks for certain conditions that may be of interest.  It can also output a summary of edges to be drawn, either as a data frame or in a LaTeX ready form, or a data frame of orphaned nodes.
}
\usage{
sumHPD(HPD, chk.all = FALSE, chk.sm.pt = FALSE, chk.ax.jump = FALSE,
	chk.sm.ax = FALSE, chk.orphan.node = FALSE,
	plot.list = FALSE, tex = FALSE, orphan.list = FALSE)
}
\arguments{
  \item{HPD}{
An object of S3 class \code{HivePlotData}.}
  \item{chk.all}{
Logical; should all the checks below be run?  See Details.
}
  \item{chk.sm.pt}{
Logical; should the edges be checked to see if any of them start and end on the same axis with the same radius?  See Details.
}
  \item{chk.ax.jump}{
Logical; should the edges be checked to see if any of them start and end on non-adjacent axes, e.g. axis 1 --> axis 3?  See Details.
}
  \item{chk.sm.ax}{
Logical; should the edges be checked to see if any of them start and end on the same axis?
}
  \item{chk.orphan.node}{
Logical; should orphan nodes be identifed?  Orphan nodes have degree 0 (no incoming or outgoing edges).
}

  \item{plot.list}{
Logical; should a data frame of edges to be drawn be returned?
}
  \item{tex}{
Logical; should the \code{plot.list} be formatted for LaTeX?
}
  \item{orphan.list}{
Logical; should a data frame of orphaned nodes be returned?
}

}
\details{
Argument \code{chk.sm.pt} applies only to hive plots of \code{type = 2D} and only when edges exist that start and end on the same axis.  It checks to see if any of the edges start and end at the same radius on the same axis, which causes an error in \code{plotHive} since you are trying to draw an edge of length zero (the actual error message is \code{Error in calcCurveGrob(x, x$debug) : End points must not be identical}.  Some data sets may have such cases intrinsically or due to data entry error, or the condition may arise during processing.  Either way, one needs to be able to detect such cases for removal or modification. This argument will tell you which nodes cause the problem.
\cr
\cr
Argument \code{chk.ax.jump} applies only to hive plots of \code{type = 2D}.  It checks to see if any of the edges jump an axis, e.g. axis 1 --> axis 3. This argument will tell you which nodes are at either end of the jumping edge.  Jumping should should be avoided in hive plots as it makes the plot aesthetically unpleasing.  However, depending upon how you process the data, this condition may arise and hence it is useful to be able to locate jumps.
}

\value{
A summary of the \code{HivePlotData} object's key characteristics is printed at the console, followed by the results of any checks set to \code{TRUE}.  The format of these results is identical to that of \code{plot.list} described just below, except for the orphan node check.  This is formatted the same as \code{HPD$nodes}; see \code{?HPD} for details. 
\cr
\cr
If \code{plot.list = TRUE}, a data frame containing a list of the edges to be drawn in a format suitable for troubleshooting a plot.  If \code{tex = TRUE} as well, the data frame will be in a format suitable for pasting into a LaTeX document.  The data frame will contain rows describing each edge to be drawn with the following columns: node 1 id, node 1 axis, node 1 label, node 1 radius, then the same info for node 2, then the edge weight and the edge color.
\cr
\cr
If \code{orphan.list = TRUE} a data frame giving the orphan nodes is returned.  If you want both \code{plot.list} and \code{orphan.list} you have to call this function twice.
}
\references{
\url{http://academic.depauw.edu/~hanson/HiveR/HiveR.html}
}
\author{
Bryan A. Hanson, DePauw University. \email{hanson@depauw.edu}
}
\examples{
set.seed(55)
test <- ranHiveData(nx = 4, ne = 5, desc = "Tiny 4D data set")
out <- sumHPD(test, chk.all = TRUE, plot.list = TRUE)
print(out)
}
\keyword{ utilities }
