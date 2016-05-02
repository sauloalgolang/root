#!/bin/bash

set -xeu

MY_PATH=$(dirname "$0")              # relative
MY_PATH=$( cd "${MY_PATH}" && pwd )
source ${MY_PATH}/mount

mkdir -p builds || true

INGO=$1
EXE=$(basename $INGO)
EXE=${EXE%%.go}

SHA=$(cd $(dirname $1) && git rev-parse --short HEAD)

echo "INPUT GO   ${INGO}"
echo "OUPUT BASE ${EXE}"

${DOCKER_CMD} bash -c                          "\
for GOOS in windows linux; do                   \
  for GOARCH in amd64; do                       \
   EXT=\"\";                                    \
   ENV=\"GOOS=\${GOOS} GOARCH=\${GOARCH}\";     \
   if [[ \"\${GOOS}\" = \"windows\" ]]; then    \
    EXT=\".exe\";                               \
    ENV=\"\${ENV} CGO_ENABLED=0\";              \
   fi;                                          \
   OF=builds/${EXE}-\${GOOS}-\${GOARCH}\${EXT}; \
   echo \"OF \${OF}\";                          \
   bash -c \"\${ENV} go build -v -ldflags \\\"-X main.Build=$SHA\\\" -o \${OF} ${INGO}\"; \
  done                                          \
done"


    #GOARCH=386;                                 \
