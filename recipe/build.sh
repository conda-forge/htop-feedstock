#!/bin/bash
set -euo pipefail
./autogen.sh

./configure \
    --prefix="${PREFIX}" \
    --sysconfdir="${PREFIX}/etc" \
    --enable-cgroup \
    --enable-delayacct \
    --enable-openvz \
    --enable-unicode \
    --enable-vserver

make -j${CPU_COUNT}

make check

make install
