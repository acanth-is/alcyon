# SPDX-FileCopyrightText: 2024 Petros Koutsolampros
#
# SPDX-License-Identifier: GPL-3.0-or-later

context("Conversion tests")

test_that("sf line map to ShapeMap", {
  lineStringMap <- loadSmallAxialLinesAsSf()$sf

  shapeMap <- Rcpp_toShapeMap(lineStringMap, c(1L, 2L))

  expectedColNames <- c(
    "Ref",
    "df_row_name",
    "df_1_Depthmap_Ref",
    "df_2_Choice"
  )
  attrNames <- Rcpp_ShapeMap_getAttributeNames(shapeMap)
  expect_identical(expectedColNames, attrNames)

  firstCol <- attrNames[[1L]]
  firstColData <- Rcpp_ShapeMap_getAttributeData(shapeMap, firstCol)[[firstCol]]
  expect_length(firstColData, nrow(lineStringMap))
})

test_that("sf line map to Axial ShapeGraph", {
  lineStringMap <- loadSmallAxialLinesAsSf()$sf

  shapeMap <- Rcpp_toShapeMap(lineStringMap, c(1L, 2L))
  shapeGraph <- Rcpp_toAxialShapeGraph(shapeMap)

  expectedColNames <- c(
    "Ref",
    "Connectivity",
    "Line Length",
    "Data Map Ref",
    "df_row_name",
    "df_1_Depthmap_Ref",
    "df_2_Choice"
  )
  attrNames <- Rcpp_ShapeMap_getAttributeNames(shapeGraph)
  expect_identical(expectedColNames, attrNames)

  firstCol <- attrNames[[1L]]
  firstColData <- Rcpp_ShapeMap_getAttributeData(
    shapeGraph,
    firstCol
  )[[firstCol]]
  expect_length(firstColData, nrow(lineStringMap))

  axialConnections <- Rcpp_ShapeGraph_getAxialConnections(shapeGraph)
  expect_length(axialConnections$from, 232L)
})

test_that("sf line map to Segment ShapeGraph", {
  lineStringMap <- loadSmallAxialLinesAsSf()$sf

  shapeMap <- Rcpp_toShapeMap(lineStringMap, c(1L, 2L))
  shapeGraph <- Rcpp_toAxialShapeGraph(shapeMap)

  segmentMap <- Rcpp_axialToSegment(shapeGraph)

  expectedColNames <- c(
    "Ref",
    "Axial Line Ref",
    "Segment Length",
    "Angular Connectivity",
    "Connectivity",
    "Axial Connectivity",
    "Axial Line Length",
    "Axial Data Map Ref",
    "Axial df_row_name",
    "Axial df_1_Depthmap_Ref",
    "Axial df_2_Choice"
  )
  attrNames <- Rcpp_ShapeMap_getAttributeNames(segmentMap)
  expect_identical(expectedColNames, attrNames)

  firstCol <- attrNames[[1L]]
  firstColData <- Rcpp_ShapeMap_getAttributeData(
    segmentMap,
    firstCol
  )[[firstCol]]
  expect_length(firstColData, 293L)

  segmentConnections <- Rcpp_ShapeGraph_getSegmentConnections(segmentMap)
  expect_length(segmentConnections$from, 1392L)
})
