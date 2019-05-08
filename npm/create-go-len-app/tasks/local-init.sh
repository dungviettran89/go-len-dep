#!/usr/bin/env bash
set -e
npm run clean
mkdir -p dist/test-app
mkdir -p dist/test-app/npm-cache
cd dist/test-app
NPM="npm --registry=http://localhost:4873 --cache ./npm-cache"
$NPM install @go-len/create-go-len-app-local
$NPM init @go-len/go-len-app-local
$NPM install
$NPM run go-build
./go-len-base
