#!/bin/bash
set -euo pipefail
set -x

./autogen.sh

if [ "${target_platform}" = linux-* ]; then
    export CFLAGS="$CFLAGS -lrt"
fi

./configure \
    --prefix="${PREFIX}" \
    --sysconfdir="${PREFIX}/etc" \
    --enable-cgroup \
    --enable-openvz \
    --enable-unicode \
    --enable-vserver

# --enable-delayacct should be enabled once building against the CentOS 7 kernel

make -j${CPU_COUNT}

if [[ "${CONDA_BUILD_CROSS_COMPILATION-}" != "1" ]]; then
    make check
fi

make install
