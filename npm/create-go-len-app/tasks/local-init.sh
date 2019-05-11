#!/usr/bin/env bash
set -e
npm run clean
mkdir -p build/test-app
mkdir -p build/test-app/npm-cache
cd build/test-app
NPM="npm --registry=http://localhost:4873 --cache ./npm-cache"
$NPM init -y
$NPM i --no-save -f @go-len/create-go-len-app-local
$NPM init @go-len/go-len-app-local
#$NPM i -D @go-len/go-len-runtime-macos
$NPM i

$NPM run go-run
