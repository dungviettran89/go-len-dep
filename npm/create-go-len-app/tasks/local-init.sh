#!/usr/bin/env bash
set -e
npm run clean
mkdir -p dist/test-app
cd dist/test-app
npm init @go-len/go-len-app -U --registry=http://localhost:4873
#npx @go-len/create-go-len-app@latest
npm install --registry=http://localhost:4873
npm run go-build
./go-len-base