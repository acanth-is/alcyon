# SPDX-FileCopyrightText: 2024 Petros Koutsolampros
#
# SPDX-License-Identifier: GPL-3.0-or-later

#' Get map name
#' @param map A sala map
#' @importFrom methods setGeneric
setGeneric(
  "name",
  function(map) standardGeneric("name")
)

#' Get map connections
#' @param map A sala map
#' @importFrom methods setGeneric
setGeneric(
  "connections",
  function(map) standardGeneric("connections")
)

#' Get map links
#' @param map A sala map
#' @importFrom methods setGeneric
#' @importFrom methods .valueClassTest
setGeneric("links",
  function(map) standardGeneric("links"),
  valueClass = "matrix"
)

#' Get map unlinks
#' @param map A sala map
#' @importFrom methods setGeneric
#' @importFrom methods .valueClassTest
setGeneric("unlinks",
  function(map) standardGeneric("unlinks"),
  valueClass = "matrix"
)

#' Link map cells/lines as if selecting them using points
#' @param map A sala map
#' @param fromX X coordinate of the origin point
#' @param fromY Y coordinate of the origin point
#' @param toX X coordinate of the target point
#' @param toY Y coordinate of the target point
#' @importFrom methods setGeneric
setGeneric(
  "linkCoords",
  function(map, fromX, fromY, toX, toY) {
    standardGeneric("linkCoords")
  }
)

#' Unlink map cells/lines as if selecting them using points
#' @param map A sala map
#' @param fromX X coordinate of the origin point
#' @param fromY Y coordinate of the origin point
#' @param toX X coordinate of the target point
#' @param toY Y coordinate of the target point
#' @importFrom methods setGeneric
setGeneric(
  "unlinkCoords",
  function(map, fromX, fromY, toX, toY) {
    standardGeneric("unlinkCoords")
  }
)

#' Link map cells/lines using their refs
#' @param map A sala map
#' @importFrom methods setGeneric
#' @param fromRef The ref of the origin element
#' @param toRef The ref of the target element
setGeneric(
  "linkRefs",
  function(map, fromRef, toRef) {
    standardGeneric("linkRefs")
  }
)

#' Unlink map cells/lines using their refs
#' @param map A sala map
#' @param fromRef The ref of the origin element
#' @param toRef The ref of the target element
#' @importFrom methods setGeneric
setGeneric(
  "unlinkRefs",
  function(map, fromRef, toRef) {
    standardGeneric("unlinkRefs")
  }
)

#' Unlink map lines at their crossing point
#' @param map A sala map
#' @param x X coordinate of the crossing point
#' @param y Y coordinate of the crossing point
#' @importFrom methods setGeneric
setGeneric(
  "unlinkAtCrossPoint",
  function(map, x, y) {
    standardGeneric("unlinkAtCrossPoint")
  }
)
