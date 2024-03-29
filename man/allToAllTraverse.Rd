% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/allToAllTraverse.R
\name{allToAllTraverse}
\alias{allToAllTraverse}
\title{All-to-all traversal}
\usage{
allToAllTraverse(
  map,
  traversalType,
  radii,
  radiusTraversalType,
  weightByAttribute = NULL,
  includeBetweenness = FALSE,
  quantizationWidth = NA,
  gatesOnly = FALSE,
  verbose = FALSE,
  progress = FALSE
)
}
\arguments{
\item{map}{A PointMap, Axial ShapeGraph or Segment ShapeGraph}

\item{traversalType}{The traversal type. See \link{TraversalType}}

\item{radii}{A list of radii}

\item{radiusTraversalType}{The traversal type to keep track of whether the
analysis is within the each radius limit. See \link{TraversalType}}

\item{weightByAttribute}{The attribute to weigh the analysis with}

\item{includeBetweenness}{Set to TRUE to also calculate betweenness (known as
Choice in the Space Syntax domain)}

\item{quantizationWidth}{Set this to use chunks of this width instead of
continuous values for the cost of traversal. This is equivalent to the "tulip
bins" for depthmapX's tulip analysis (1024 tulip bins = pi/1024
quantizationWidth). Only works for Segment ShapeGraphs}

\item{gatesOnly}{Optional. Only calculate results at particular gate pixels.
Only works for PointMaps}

\item{verbose}{Optional. Show more information of the process.}

\item{progress}{Optional. Enable progress display}
}
\value{
Returns a list with:
\itemize{
  \item{completed: Whether the analysis completed}
  \item{newAttributes: The new attributes that were created during the
  process}
}
}
\description{
Runs all-to-all traversal on a map with a graph. This is applicable to:
\itemize{
  \item{PointMaps (Visibility Graph Analysis)}
  \item{Axial ShapeGraphs (Axial analysis)}
  \item{Segment ShapeGraphs (Segment analysis)}
}
}
