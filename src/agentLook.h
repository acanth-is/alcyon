// SPDX-FileCopyrightText: 2024 Petros Koutsolampros
//
// SPDX-License-Identifier: GPL-3.0-or-later

// The values here should be kept the same as the ones in agentLook.R

#pragma once

#include <Rcpp.h>

enum class AgentLook {
  None = 0,
    Standard = 1,
    LineOfSightLength = 2,
    OcclusionLength = 3,
    OcclusionAny = 4,
    OcclusionGroup45 = 5,
    OcclusionGroup60 = 6,
    OcclusionFurthest = 7,
    BinFarDistance = 8,
    BinAngle = 9,
    BinFarDistanceAngle = 10,
    BinMemory = 11
};
