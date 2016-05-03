#!/bin/bash

set -xeu

MY_PATH=$(dirname "$0")              # relative
MY_PATH=$( cd "${MY_PATH}" && pwd )
source ${MY_PATH}/mount

SHA=$(cd $(dirname $1) && git rev-parse --short HEAD)

${DOCKER_CMD} go install -ldflags "-X main.Build=$SHA" $@
