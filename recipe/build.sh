#!/bin/bash
set -euo pipefail
export CFLAGS="-I${PREFIX}/include ${CFLAGS}"
./autogen.sh
./configure --prefix=$PREFIX --disable-dependency-tracking
make
make check
make install
