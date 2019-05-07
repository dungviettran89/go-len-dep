#!/usr/bin/env bash
set -e
cd dist
VERSION=$(date '+%Y%m%d%H%M%S')
npm version 0.1.$VERSION
npm publish --access=public --tag=dev$VERSION
