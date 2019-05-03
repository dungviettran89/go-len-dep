# Go Lên Dep
Dependencies Management make simple

## Introduction
Developing Go from inside corporate network or behind HTTP proxy is always a problem for 
early adopters. This module eases the pain by introducing a seamless bridge between local 
development environment and build servers. 

This module provide multiple methods to utilize existing setup for Java / NodeJS to perform
Go development.

## Athens 
Use our Athens proxy by setting GOPROXY environment variable

Unix / MacOS:
```bash
export GOPROXY=https://athens.cuatoi.us/
go build
```

Windows:
```bat
set GOPROXY=https://athens.cuatoi.us/
go build
```

