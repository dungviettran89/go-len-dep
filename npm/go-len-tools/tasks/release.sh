#!/usr/bin/env bash
set -e
npm run clean
npm run compile
cd dist
npm publish --access=public --tag=latest