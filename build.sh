#!/usr/bin/env bash
set -e

CFLAGS="-g -O3"

HERE="$(dirname "${0}")"
pushd "${HERE}"
ion paltool
popd

O="${HERE}/paltool.elf"
cc "${HERE}"/out_paltool.c -o "${O}" $CFLAGS && printf "PROGRAM\t%s\n" "${O}"

