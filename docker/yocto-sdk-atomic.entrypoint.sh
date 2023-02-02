#!/bin/sh

HW_REV_FILE=/etc/hwrevision

#SRCENV#

export QEMU_LD_PREFIX=${SDKTARGETSYSROOT}
if [ -e ${SDKTARGETSYSROOT}${HW_REV_FILE} ]; then
  MACHINE=$(cat ${SDKTARGETSYSROOT}${HW_REV_FILE} | awk '{print $1}')
  HW_REV=$(cat ${SDKTARGETSYSROOT}${HW_REV_FILE} | awk '{print $2}')
  [ ! -z $MACHINE ] && export MACHINE
  [ ! -z $HW_REV ] && export HW_REV
fi

exec "$@"
