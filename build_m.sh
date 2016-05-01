#!/bin/bash

set -xeu

MY_PATH=$(dirname "$0")              # relative
MY_PATH=$( cd "${MY_PATH}" && pwd )
source ${MY_PATH}/mount

mkdir -p builds || true

INGO=$1
EXE=$(basename $INGO)
EXE=${EXE%%.go}

echo "INPUT GO   ${INGO}"
echo "OUPUT BASE ${EXE}"

${DOCKER_CMD} bash -c                          "\
for GOOS in windows linux; do                   \
  for GOARCH in amd64; do                       \
   EXT=\"\";                                    \
   if [[ \"\${GOOS}\" = \"windows\" ]]; then    \
    export CGO_ENABLED=0;                       \
    EXT=\".exe\";                               \
   fi;                                          \
   OF=builds/${EXE}-\${GOOS}-\${GOARCH}\${EXT}; \
   echo \"OF \${OF}\";                          \
   GOOS=\${GOOS} GOARCH=\${GOARCH} go build -v -o \${OF} ${INGO}; \
  done                                          \
done"


    #GOARCH=386;                                 \
