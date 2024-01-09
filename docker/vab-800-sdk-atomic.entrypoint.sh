#!/bin/bash

export QEMU_LD_PREFIX=/opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/arm-fsl-linux-gnueabi/multi-libs
export PATH=/opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin:$PATH
export CROSS=arm-fsl-linux-gnueabi
export CXX=${CROSS}-g++

for i in gcc cpp ar as nm objcopy strip cc ranlib gdb ld; do
  export ${i^^}=${CROSS}-${i};
done

exec "$@"
