#!/bin/bash
set -e

PRG=${1:-examples/hello/test.prg}

echo "[Linux] Compilando ${PRG}..."
/opt/harbour-linux/bin/hbmk2 "$PRG" -otest-linux

echo "[DOS] Compilando ${PRG}..."
source ./scripts/hb_dos_env.sh
hbmk2 "$PRG" -otest-msdos

echo "OK: test-linux e test-msdos.exe gerados."
