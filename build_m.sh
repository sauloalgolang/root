docker run --rm -it -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.6 bash \
for GOOS in windows linux; do            \
  for GOARCH in amd64; do                \
    go build -v -o myapp-$GOOS-$GOARCH   \
  done                                   \
done
