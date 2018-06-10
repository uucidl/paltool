#!/usr/bin/env bash
set -e
HERE="$(dirname "${0}")"
pushd "${HERE}"
ion paltool
cc out_paltool.c -o paltool.elf
popd

