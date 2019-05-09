#!/usr/bin/env bash
npm run clean
mkdir -p dist/test
cd dist/test
NPM="npm --registry=http://localhost:4873 --cache ./npm-cache"
$NPM init -y
$NPM i --no-save @go-len/go-len-runtime-windows
$NPM i --no-save @go-len/go-len-runtime-linux
$NPM i --no-save @go-len/go-len-runtime-macos