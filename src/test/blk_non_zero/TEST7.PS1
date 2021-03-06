# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2015-2019, Intel Corporation
#
# src/test/blk_non_zero/TEST7 -- unit test for
# pmemblk_read/write/set_zero/set_error
#

. ..\unittest\unittest.ps1

require_test_type medium

# doesn't make sense to run in local directory
require_fs_type pmem non-pmem

setup

# mix writes with set_zero and set_error and check results
$FILE_SIZE = $((1024*1024*1024))
require_free_space "${FILE_SIZE}b"

expect_normal_exit $Env:EXE_DIR\blk_non_zero$Env:EXESUFFIX 512 `
$DIR\testfile1 c $FILE_SIZE	w:100 w:200 w:300 w:400 `
r:100 r:200 r:300 r:400	w:100 z:200 w:300 z:400 `
r:100 r:200 r:300 r:400	e:100 w:200 e:300 w:400	`
r:100 r:200 r:300 r:400

check

pass
