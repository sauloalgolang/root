docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e GOOS=windows -e GOARCH=386 golang:1.6 go build -v
#!/bin/bash

set -xeu

MY_PATH=$(dirname "$0")              # relative
MY_PATH=$( cd "${MY_PATH}" && pwd )
source ${MY_PATH}/mount

${DOCKER_CMD} go build -v $@
