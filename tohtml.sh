#!/usr/bin/env bash
USAGE="$0 <input-file.txt> <output.html>"
file=${1:?"$USAGE ^ expected input colours file"}
output=${2:?"$USAGE ^ expected output file"}
printf '<style>body { margin: 0; width: 100vw; }</style>' > "${output}"
printf '<style>div { height: 12px; }</style>' >> "${output}"
sort -r -n "$file" | \
    grep '#' | \
    cut -f3 | \
    sed -e 's/ //g' | \
    while read c ; do \
        printf '<div style="background-color: %s;">&nbsp;</div>' $c ; \
    done >> "${output}"
