#!/bin/bash

SRC="$1"
REQ="$2"

plugins="$(paste -sd ',' "${REQ}")"

pushd "${SRC}" || exit 1
	rm -f telegraf
	BUILDTAGS="custom,${plugins}" LDFLAGS="-s -w" make
popd || exit 1
