#!/usr/bin/env bash
set -eux

if [[ $# -lt 1 ]]; then
	yq -r 'keys | .[]' packs.yml
	exit
fi
PACK=$1

SOURCES=()
for f in $(yq -r ".\"$PACK\" | .[]" packs.yml); do
	SOURCES+=(djmaxrespectv-$f.json)
done
jq -s 'flatten' "${SOURCES[@]}"
