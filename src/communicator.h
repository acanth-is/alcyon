// SPDX-FileCopyrightText: 2024 Petros Koutsolampros
//
// SPDX-License-Identifier: GPL-3.0-or-later

#pragma once

#include "genlib/comm.h"

#include <memory>

std::unique_ptr<Communicator> getCommunicator(const bool printProgress);
