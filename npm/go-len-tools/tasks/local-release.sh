#!/usr/bin/env bash
set -e
cd dist
npm version 0.1.$(date '+%Y%m%d%H%M%S')
npm publish --tag=latest --registry http://localhost:4873