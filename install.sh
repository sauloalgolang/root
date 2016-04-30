#!/bin/bash

set -xeu

#APP_NAME=$1
#DST=/usr/src/${APP_NAME}
DST=/go/src
#GPATH=$(dirname $(dirname ${DST}))
#GPATH=${DST}

mkdir bin || true

docker run -it --rm -v ${PWD}:${DST} -v ${PWD}/bin:${DST}/../bin -w ${DST} golang:1.6 bash -c "go env && go install -v $@"
