#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
if [[ $# -gt 1 || ( $# -eq 1 && "$1" != "--sync-portfolio" ) ]]; then
  echo "Usage: $0 [--sync-portfolio]" >&2
  exit 1
fi
build_dir=$(mktemp -d)
trap 'rm -rf -- "$build_dir"' EXIT
for variant in mainCpp mainJS; do
  tectonic --outdir "$build_dir" "$variant.tex"
  if [[ $(pdfinfo "$build_dir/$variant.pdf" | awk '/^Pages:/ {print $2}') != 1 ]]; then
    echo "$variant.pdf must fit on one page; inspect the source before distributing." >&2
    exit 1
  fi
done
for variant in mainCpp mainJS; do
  cp -- "$build_dir/$variant.pdf" "$variant.pdf"
done
if [[ ${1:-} == --sync-portfolio ]]; then
  cp -- mainCpp.pdf ../portfolio/public/nicholas-sobchak-resume.pdf
  cp -- mainCpp.pdf ../portfolio/public/mainJS_421_revised.pdf
fi
