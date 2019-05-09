#!/usr/bin/env bash
set -e
npm run clean
OS=$1
VERSION=$2
echo "Updating runtime:"
echo "OS=$OS"
echo "VERSION=$VERSION"

. "$(dirname ${BASH_SOURCE[0]})/common.sh"

mkdir -p dist/$OS
cp package-base.json dist/$OS/package.json
cd dist/$OS
if [ "$OS" = "windows" ]; then
    sed -i -e "s/go\/bin\/go\"/go\/bin\/go.exe\"/g" package.json
    sed -i -e "s/go\/bin\/godoc\"/go\/bin\/godoc.exe\"/g" package.json
    sed -i -e "s/go\/bin\/gofmt\"/go\/bin\/gofmt.exe\"/g" package.json
    download go$VERSION.windows-amd64.zip go.zip
    unzip go.zip
    rm go.zip
fi
if [ "$OS" = "linux" ]; then
    download go$VERSION.linux-amd64.tar.gz go.tar.gz
    tar -xf go.tar.gz
    rm go.tar.gz
fi
if [ "$OS" = "macos" ]; then
    download go$VERSION.darwin-amd64.tar.gz  go.tar.gz
    tar -xf go.tar.gz
    rm go.tar.gz
fi
sed -i -e "s/go-len-runtime/go-len-runtime-$OS/g" package.json
npm version $VERSION
npm publish --access=public --tag=latest