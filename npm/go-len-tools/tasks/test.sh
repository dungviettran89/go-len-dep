#!/usr/bin/env bash
npm run clean
npm run compile
GOLEN="node $(pwd)/dist/src/main.js"
cd ../create-go-len-app/dist/src/template
$GOLEN
