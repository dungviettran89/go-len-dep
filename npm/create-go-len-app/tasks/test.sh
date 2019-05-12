#!/usr/bin/env bash
set -e

npm run clean
npm run compile
DIST=$(pwd)/dist
mkdir -p build/test-app
cd build/test-app
node ${DIST}/src/main.js --name go-len-test-app
