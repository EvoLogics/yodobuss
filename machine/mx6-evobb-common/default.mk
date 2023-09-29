# Image name to build by default
IMAGE_NAME        = evologics-base-image-mx6

# MACHINE is a must in local.conf
LOCAL_CONF_OPT    = 'MACHINE = "$(MACHINE)"'
BUILD_DIR         = build-mx6

################ begin build/conf/local.conf options ###################
$(call local_conf_options_begin)

# Define what we need
PACKAGE_CLASSES             = package_ipk
TCLIBC                      = glibc

# Must have for the platform
CORE_IMAGE_EXTRA_INSTALL    = rng-tools iproute2
# Very useful software
CORE_IMAGE_EXTRA_INSTALL   += opkg dropbear bash tar monit procps util-linux \
                              update-rc.d \
                              e2fsprogs e2fsprogs-resize2fs iputils coreutils limitcpu
# Useful software
CORE_IMAGE_EXTRA_INSTALL   += netcat-openbsd screen tmux socat rsync file \
                              htop tcpdump iptables \
                              daemonize curl rlwrap ckermit iperf3 lrzsz ttyd \
                              rtklib-cli-str2str zerotier mosquitto-clients
# Hardware tools
CORE_IMAGE_EXTRA_INSTALL   += can-utils cannelloni i2c-tools pps-tools pciutils \
                              usbutils ethtool libgpiod spitools avrdude uhubctl \
                              quectel-cm
# Development
CORE_IMAGE_EXTRA_INSTALL   += ltrace strace kernel-devicetree tcl expect
# Time management
CORE_IMAGE_EXTRA_INSTALL   += gpsd-tiny chrony chronyc soft-hwclock
# FAT/exFAT support
CORE_IMAGE_EXTRA_INSTALL   += fuse-exfat exfat-utils
# Init for read-only rootfs
CORE_IMAGE_EXTRA_INSTALL   += evo-envinit
# Bootloader environment utils
CORE_IMAGE_EXTRA_INSTALL   += u-boot-fw-utils

#CORE_IMAGE_EXTRA_INSTALL  += openssh-client keychain
#CORE_IMAGE_EXTRA_INSTALL  += ntp kernel-module-pps-gpio

PRSERV_HOST = localhost:0

DISTRO_FEATURES_remove = bluetooth wayland
EXTRA_IMAGE_FEATURES_append = package-management read-only-rootfs

BBMASK_append  = .*at91.*
BBMASK_append += .*-phy[0-9]\..*

$(call local_conf_options_end)
################ end build/conf/local.conf options #####################

LOCAL_CONF_OPT += 'PNBLACKLIST[libubootenv] = "Prevents selecting right u-boot-fw-utils"'
LOCAL_CONF_OPT += 'INHERIT += " userconfig "'

# If layer branch not set with "branch=" option, YOCTO_RELEASE will be used.
# If layer has no such branch, 'master' branch will be used.
YOCTO_RELEASE     = thud

# Layers to download and add to the configuration.
# Layers must me in right order, layers used by other layers must become first.
# Syntax: url[;option1=value;option2=value]
# Possible options:
# 	* branch=<branch-to-clone>
# 	* subdirs=<subdirectory with meta-layer>[,<subdirectory with meta-layer>]
LAYERS           += \
                    git://git.openembedded.org/meta-openembedded;subdirs=meta-oe,meta-python,meta-networking,meta-filesystems \
                    https://git.yoctoproject.org/git/meta-freescale \
                    https://github.com/Freescale/meta-freescale-3rdparty \
                    https://github.com/sbabic/meta-swupdate \
                    git://git.toradex.com/meta-toradex-bsp-common.git \
                    git://git.toradex.com/meta-toradex-nxp.git;patches=0001-linux-toradex-change-SRCPV-to-SRCREV.patch \
                    https://github.com/evologics/meta-evo

MACHINE_BITBAKE_TARGETS = u-boot swupdate-images-evo-tx6
