#!/usr/bin/env bash
set -e
npm run clean
mkdir -p dist/test-app
cd dist/test-app
echo "registry=http://localhost:4873" > .npmrc
npm init @go-len/go-len-app
npm install
npm run go-build
./go-len-base