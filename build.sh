#!/bin/bash

set -xeu

DN=$(basename $PWD)

docker run -it --rm -v "$PWD":/go/src -w /go/src golang:1.6 go build -v $@
