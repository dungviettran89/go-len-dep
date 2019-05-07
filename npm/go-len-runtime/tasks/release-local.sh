#!/usr/bin/env bash
set -e
npm run clean
OS=$1
VERSION=$2
echo "Updating runtime:"
echo "OS=$OS"
echo "VERSION=$VERSION"

mkdir -p dist/$OS
cp package.json dist/$OS
cd dist/$OS
if [ "$OS" = "windows" ]; then
    wget https://dl.google.com/go/go$VERSION.windows-amd64.zip -O go.zip
    unzip go.zip
    rm go.zip
fi
if [ "$OS" = "linux" ]; then
    wget https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz -O go.tar.gz
    tar -xf go.tar.gz
    rm go.tar.gz
fi
if [ "$OS" = "macos" ]; then
    wget https://dl.google.com/go/go$VERSION.darwin-amd64.tar.gz -O go.tar.gz
    tar -xf go.tar.gz
    rm go.tar.gz
fi
sed -i -e "s/go-len-runtime/go-len-runtime-$OS/g" package.json
npm version $VERSION
npm publish --registry http://localhost:4873