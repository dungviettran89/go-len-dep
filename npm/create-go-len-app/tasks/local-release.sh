#!/usr/bin/env bash
set -e
npm version prerelease
npm run clean
npm run compile
cd dist
npm publish --tag=latest --registry http://localhost:4873