#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Blazelight Pty Ltd
# SPDX-License-Identifier: Apache-2.0
#
# pytest.yml's plumbing, as this repository's CI calls it (.github/workflows/ci.yml): the shard,
# the durations file, the mirrors left out, and the arguments passed through.
set -euo pipefail
echo "shard=$ARH_TEST_SHARD durations=$ARH_TEST_DURATIONS_OUT args=$*"
[[ "$ARH_TEST_SHARD" =~ ^[12]/2$ ]]
[[ "$ARH_TEST_DURATIONS_OUT" == "selftest-durations-${ARH_TEST_SHARD%/2}.json" ]]
[[ -z "${ARH_TEST_PIP_INDEX:-}" && -z "${ARH_TEST_IMAGE_CACHE:-}" ]]
[[ "$*" == "one two" ]]
echo '{}' > "$ARH_TEST_DURATIONS_OUT"
