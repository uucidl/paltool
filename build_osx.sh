#!/usr/bin/env bash
set -e
HERE="$(dirname "${0}")"
if [[ -z "${OUTPUT_DIR}" ]] ; then OUTPUT_DIR="${HERE}"/output; fi
CFLAGS="${CFLAGS}"

[[ -d "${OUTPUT_DIR}" ]] || mkdir -p "${OUTPUT_DIR}"

C="${OUTPUT_DIR}"/out_paltool_osx_x64.c
pushd "${HERE}"
ion -os osx -arch x64 -o "$C" paltool
popd

O="${HERE}/paltool.elf"
cc "${C}" -o "${O}" $CFLAGS && printf "PROGRAM\t%s\n" "${O}"

