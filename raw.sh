#!/bin/bash

set -xeu

MY_PATH=$(dirname "$0")              # relative
MY_PATH=$( cd "${MY_PATH}" && pwd )
source ${MY_PATH}/mount

${DOCKER_CMD} bash -c "$@"
