#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
    echo "You may need to run this script as sudo if you see permission errors"
fi
if [ ! -z "${SUDO_USER}" ]; then
    user=${SUDO_USER}
else
    user=`whoami`
fi
set -e
cat << EOF > /etc/udev/rules.d/99-oe4t.rules
# Jetson Xavier NX
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0955", ATTRS{idProduct}=="7e19", GROUP="plugdev"
# Jetson Nano
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0955", ATTRS{idProduct}=="7f21", GROUP="plugdev"
EOF
udevadm control --reload
echo "udev settings applied, please disconnect/reconnect your device"
set +e
groups ${user} | grep "plugdev" > /dev/null 2>&1
rc=$?
if [ $rc -ne 0 ]; then
    echo "Please add ${user} to plugdev using:"
    echo "sudo usermod -a -G plugdev  ${user}"
    echo "Then apply to your user by logging back into the session or running"
    echo "newgrp plugdev"
fi