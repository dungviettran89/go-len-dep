#!/usr/bin/env bash
set -e
npm run clean
mkdir -p dist/test-app
mkdir -p dist/test-app/npm-cache
cd dist/test-app
NPM="npm --registry=http://localhost:4873 --cache ./npm-cache"
$NPM init -y
$NPM i --no-save -f @go-len/create-go-len-app-local
$NPM init @go-len/go-len-app-local
$NPM i -D @go-len/go-len-runtime-linux
$NPM i
$NPM run go-run
