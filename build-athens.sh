#!/bin/bash
set -e
[[ ! -d athens ]] &&  git clone https://github.com/gomods/athens.git;
[[ -d athens ]] && cd athens && git pull && cd ..;
cd athens;
make build-ver VERSION="0.2.0"
cd ..
docker build .