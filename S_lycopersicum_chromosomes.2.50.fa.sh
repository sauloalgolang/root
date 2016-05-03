#!/bin/bash

set -eu

FA=S_lycopersicum_chromosomes.2.50.fa
URL=ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/assembly/build_2.50/

if [[ ! -f "$FA" ]]; then
	wget ${URL}/${FA}
fi

if [[ 0 == 1 ]]; then
echo COMPILING FASTAINDEXER
time ./run.sh github.com/sauloalgolang/fastareader/fastaindexer/fastaindexer.go   ${FA}
./install.sh  github.com/sauloalgolang/fastareader/fastaindexer/
./build_m.sh  github.com/sauloalgolang/fastareader/fastaindexer/fastaindexer.go
bin/fastaindexer ${FA}
fi


if [[ 0 == 1 ]]; then
echo COMPILING FASTAREADER
time ./run.sh github.com/sauloalgolang/fastareader/fastareader/fastareader.go     ${FA}
./install.sh  github.com/sauloalgolang/fastareader/fastareader/
./build_m.sh  github.com/sauloalgolang/fastareader/fastareader/fastareader.go
bin/fastareader ${FA}
fi


if [[ 1 == 1 ]]; then
echo COMPILING KMEREXTRACTOR
#time ./run.sh github.com/sauloalgolang/fastareader/kmerextractor/kmerextractor.go ${FA}
#./install.sh  github.com/sauloalgolang/fastareader/kmerextractor/
./build_m.sh  github.com/sauloalgolang/fastareader/kmerextractor/kmerextractor.go
bin/kmerextractor ${FA}
fi



