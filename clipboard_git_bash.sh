#!/usr/bin/env bash
set -e

ARG="$1"
if [[ -e "$ARG" ]]; then
    cat "$ARG" > /dev/clipboard
else
    printf "$ARG" > /dev/clipboard
fi
