#!/usr/bin/env bash
set -e
npm run clean
mkdir -p build/test-app
mkdir -p build/test-app/npm-cache
cd build/test-app
NPM="npm --registry=http://localhost:4873 --cache ./npm-cache"
$NPM init -y
$NPM i -f @go-len/create-go-len-app
$NPM init @go-len/go-len-app
$NPM i @go-len/go-len-tools@latest --save
$NPM run start
