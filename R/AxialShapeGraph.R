# SPDX-FileCopyrightText: 2024 Petros Koutsolampros
#
# SPDX-License-Identifier: GPL-3.0-or-later

#' Axial ShapeGraph
#'
#' A representation of sala's Axial ShapeGraph in R. Holds onto a sala Axial
#' ShapeGraph pointer and operates on that
#' @importFrom methods setClass
setClass("AxialShapeGraph", contains = "ShapeGraph")

#' Get the Axial ShapeGraph connections
#'
#' @param map An Axial ShapeGraph
#' @returns A matrix with the connected refs
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "connections",
  signature = c(map = "AxialShapeGraph"),
  function(map) {
    Rcpp_ShapeGraph_getAxialConnections(map@ptr)
  }
)

#' Get the Axial ShapeGraph links
#'
#' @param map An Axial ShapeGraph
#' @returns A matrix with the linked refs
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "links",
  signature = c(map = "AxialShapeGraph"),
  function(map) {
    Rcpp_ShapeGraph_getLinksUnlinks(map@ptr)
  }
)

#' Link two Axial Lines (coordinates)
#'
#' Link two locations on an Axial ShapeGraph using the point coordinates
#'
#' @param map An Axial ShapeGraph
#' @param fromX X coordinate of the first link point
#' @param fromY Y coordinate of the first link point
#' @param toX X coordinate of the second link point
#' @param toY Y coordinate of the second link point
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "linkCoords",
  signature = c(map = "AxialShapeGraph"),
  function(map, fromX, fromY, toX, toY) {
    Rcpp_ShapeGraph_linkCoords(
      map@ptr,
      cbind(fromX, fromY, toX, toY)
    )
  }
)

#' Unlink two Axial Lines (coordinates)
#'
#' Unlink two locations on an Axial ShapeGraph using the point coordinates
#'
#' @param map An Axial ShapeGraph
#' @param fromX X coordinate of the first unlink point
#' @param fromY Y coordinate of the first unlink point
#' @param toX X coordinate of the second unlink point
#' @param toY Y coordinate of the second unlink point
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "unlinkCoords",
  signature = c(map = "AxialShapeGraph"),
  function(map, fromX, fromY, toX, toY) {
    Rcpp_ShapeGraph_unlinkCoords(
      map@ptr,
      cbind(fromX, fromY, toX, toY)
    )
  }
)

#' Link two Axial Lines (refs)
#'
#' Link two lines on an Axial ShapeGraph using their refs
#'
#' @param map An Axial ShapeGraph
#' @param fromRef Ref of the first link line
#' @param toRef Ref of the second link line
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "linkRefs",
  signature = c(map = "AxialShapeGraph"),
  function(map, fromRef, toRef) {
    Rcpp_ShapeGraph_linkRefs(
      map@ptr,
      cbind(fromRef, toRef)
    )
  }
)

#' Unlink two Axial Lines (refs)
#'
#' Unlink two lines on an Axial ShapeGraph using their refs
#'
#' @param map An Axial ShapeGraph
#' @param fromRef Ref of the first unlink line
#' @param toRef Ref of the second unlink line
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "unlinkRefs",
  signature = c(map = "AxialShapeGraph"),
  function(map, fromRef, toRef) {
    Rcpp_ShapeGraph_unlinkRefs(
      map@ptr,
      cbind(fromRef, toRef)
    )
  }
)


#' Unlink two Axial Lines (crosspoint)
#'
#' Unlink two crossing lines on an Axial ShapeGraph at the crossing point
#'
#' @param map An Axial ShapeGraph
#' @param x X coordinate of the unlink crossing point
#' @param y Y coordinate of the unlink crossing point
#' @docType methods
#' @importFrom methods setMethod
#' @export
setMethod(
  "unlinkAtCrossPoint",
  signature = c(map = "AxialShapeGraph"),
  function(map, x, y) {
    Rcpp_ShapeGraph_unlinkAtCrossPoint(
      map@ptr,
      cbind(x, y)
    )
  }
)

#' as("sf", "AxialShapeGraph")
#'
#' @name as
#' @family AxialShapeGraph
#'
#' @importFrom methods as
setAs("sf", "AxialShapeGraph", function(from) {
  shapeGraph <- new("AxialShapeGraph")
  shapeMap <- as(from, "ShapeMap")
  shapeGraph@ptr <- Rcpp_toAxialShapeGraph(shapeMap@ptr)
  return(shapeGraph)
})
