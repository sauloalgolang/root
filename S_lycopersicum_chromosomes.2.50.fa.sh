#!/bin/bash

set -eu

FA=S_lycopersicum_chromosomes.2.50.fa
URL=ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/assembly/build_2.50/

if [[ ! -f "$FA" ]]; then
	wget ${URL}/${FA}
fi

#./run.sh github.com/sauloalgolang/fastareader/fastareader/fastareader.go ${FA}

./install.sh github.com/sauloalgolang/fastareader/fastareader

./install.sh github.com/sauloalgolang/fastareader/fastaindexer

#bin/fastareader ${FA}

./build_m.sh github.com/sauloalgolang/fastareader/fastareader/fastareader.go

