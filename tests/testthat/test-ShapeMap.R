# SPDX-FileCopyrightText: 2024 Petros Koutsolampros
#
# SPDX-License-Identifier: GPL-3.0-or-later

context("ShapeMap tests")

test_that("Create ShapeMap", {
  shapeMapName <- "Test ShapeMap"
  shp <- ShapeMap(shapeMapName)
  expect_identical(shapeMapName, name(shp))
})

test_that("Non-numeric columns in conversion", {
  lineStringMap <- loadSmallAxialLinesAsSf()$sf
  lineStringMap$nonn1 <- "a"
  lineStringMap$nonn2 <- "a"
  expect_warning(
    as(lineStringMap, "ShapeMap"),
    "Non-numeric columns will not be transferred to the ShapeMap: nonn1 nonn2"
  )
})
