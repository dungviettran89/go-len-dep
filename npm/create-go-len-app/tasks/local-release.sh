#!/usr/bin/env bash
set -e
npm run clean
npm run compile
cd dist
VERSION=$(date '+%Y%m%d%H%M%S')
npm version 0.1.$VERSION
npm publish --tag=latest --registry http://localhost:4873