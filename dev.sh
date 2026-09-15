#!/usr/bin/env bash
set -u

TARGET="${1:-mainJS.tex}"
LAST=""

echo "Watching ${TARGET} ... (Ctrl+C to stop)"

while true; do
  MAYBE=$(stat -c '%Y.%s' "${TARGET}" 2>/dev/null || echo "")
  if [[ "${MAYBE}" != "${LAST}" ]]; then
    [[ -n "${LAST}" ]] && echo "==> Change detected, recompiling..."
    tectonic "${TARGET}"
    LAST="${MAYBE}"
  fi
  sleep 1
done