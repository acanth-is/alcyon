# SPDX-FileCopyrightText: 2024 Petros Koutsolampros
#
# SPDX-License-Identifier: GPL-3.0-or-later

# The values here should be kept the same order as the ones in TraversalType.h

#' Traversal types
#'
#' These are meant to be used to indicate what kind of analysis
#' is meant to be carried out.
#'
#' @return A list of numbers representing each particular analysis type
#' @examples
#' TraversalType$Angular
#' TraversalType$Topological
#' TraversalType$Metric
#' @export
TraversalType <- list(
  None = 0L,
  Angular = 1L,
  Topological = 2L,
  Metric = 3L
)
