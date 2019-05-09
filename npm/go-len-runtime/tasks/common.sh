#!/usr/bin/env bash
download () {
    NAME=$1
    TARGET=$2
    CACHE="../../cache/$NAME"
    echo "Downloading $NAME to $TARGET"
    if [ ! -f $CACHE ]; then
        mkdir -p "../../cache/"
        wget https://dl.google.com/go/$NAME -O $CACHE
    fi;
    cp $CACHE $TARGET
}