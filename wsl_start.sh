#!/usr/bin/env bash
set -e

FILE="$1"
powershell.exe /C start $(wslpath -w "$FILE")
