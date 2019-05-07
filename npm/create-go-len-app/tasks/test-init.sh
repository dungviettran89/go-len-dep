#!/usr/bin/env bash
set -e
mkdir -p dist/test-app
cd dist/test-app
npx --no-install --ignore-existing @go-len/create-go-len-app@dev