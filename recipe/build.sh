#!/bin/bash
set -euo pipefail
./autogen.sh

./configure \
    --prefix="${PREFIX}" \
    --sysconfdir="${PREFIX}/etc" \
    --enable-cgroup \
    --enable-openvz \
    --enable-unicode \
    --enable-vserver

# --enable-delayacct should be enabled once building against the CentOS 7 kernel

make -j${CPU_COUNT}

make check

make install
