# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2019, Intel Corporation

#
# src/test/obj_ctl_arenas/TEST0 -- unit test for arenas ctl
#

. ..\unittest\unittest.ps1

require_test_type short
require_fs_type any

setup

expect_normal_exit $Env:EXE_DIR\obj_ctl_arenas$Env:EXESUFFIX $DIR\testset1 n

pass
