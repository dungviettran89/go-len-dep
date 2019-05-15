#!/usr/bin/env bash
npm run clean
npm run compile
GOLEN="$(pwd)/dist/src/main.js"
chmod +x $GOLEN
cd ../create-go-len-app/dist/src/template
pwd
$GOLEN mod vendor
$GOLEN run main.go -mod=vendor
