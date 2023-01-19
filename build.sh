#!/bin/bash

SRC="$1"
REQ="$2"

plugins="$(paste -sd ',' "${REQ}")"

pushd "${SRC}" || exit 1
	BUILDTAGS="custom,${plugins}" LDFLAGS="-s -w" GOARCH=amd64 make
	mv telegraf telegraf.x86-64
	BUILDTAGS="custom,${plugins}" LDFLAGS="-s -w" GOARCH=arm64 make
	mv telegraf telegraf.aarch64
popd || exit 1
