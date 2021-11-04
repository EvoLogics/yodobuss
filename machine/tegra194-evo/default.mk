# Image name to build by default
IMAGE_NAME        = core-image-minimal

# MACHINE is a must in local.conf
#LOCAL_CONF_OPT    = 'MACHINE = "$(MACHINE)"'

LOCAL_CONF_OPT    = 'MACHINE = "$(MACHINE)"'

################ begin build/conf/local.conf options ###################
$(call local_conf_options_begin)

DISTRO            = poky-evo-systemd

LOCAL_CONF_OPT   += 'BBMASK   += ".*-karo.*"'
LOCAL_CONF_OPT   += 'BBMASK   += ".*toradex.*"'
LOCAL_CONF_OPT   += 'BBMASK   += ".*at91.*"'
LOCAL_CONF_OPT   += 'BBMASK   += ".*-phy[0-9].*"'
LOCAL_CONF_OPT   += 'BBMASK   += ".*barebox.*"'
LOCAL_CONF_OPT   += 'BBMASK   += ".*u-boot.*"'

# Must have for the platform
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " rng-tools iproute2 coreutils grep bridge-utils iputils iperf3 net-tools"'
# Very useful software
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " opkg dropbear bash tar procps util-linux ckermit htop sysbench gpu-burn"'
# Useful software
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " netcat-openbsd screen tmux rsync file daemonize gzip tar"'
# Hardware tools
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " can-utils i2c-tools pps-tools usbutils ethtool libgpiod pciutils"'
# Development
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " ltrace strace kernel-devicetree tcl tcpdump"'
# FAT/exFAT support
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " fuse-exfat e2fsprogs exfat-utils e2fsprogs-resize2fs parted tegra-nvpmodel "'
# Init for read-only rootfs
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " evo-envinit"'
# Communication Module Specific
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " chrony soft-hwclock"'
# Jetson Module Specific
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " tensorrt-core tegra-mmapi tegra-mmapi-dev deepstream-5.1 libvisionworks tegra194-usb-device-mode"'
# Jetson Module Specific
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " packagegroup-cuda packagegroup-tegra-docker packagegroup-gstreamer"'
# Image Update
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " swupdate"'
# Read only rootfs
LOCAL_CONF_OPT   += 'EXTRA_IMAGE_FEATURES_append = " package-management read-only-rootfs"'

LOCAL_CONF_OPT   += 'TCLIBC = "glibc"'

LOCAL_CONF_OPT   += 'PREFERRED_VERSION_python3 = "3.8%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_python3-native = "3.8%"'
# Swupdare prefered version
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_swupdate = "2021.04"'
# Gstreamer prefered version
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0 = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-libav = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-meta-base = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-omx = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-python = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-rtsp-server = "1.14.%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_gstreamer1.0-vaapi = "1.14.%"'

LOCAL_CONF_OPT   += 'LICENSE_FLAGS_WHITELIST_append = " commercial"'



$(call local_conf_options_end)
################ end build/conf/local.conf options #####################

# If layer branch not set with "branch=" option, YOCTO_RELEASE will be used.
# If layer has no such branch, 'master' branch will be used.
YOCTO_RELEASE     = dunfell

# Layers to download and add to the configuration.
# Layers must me in right order, layers used by other layers must become first.
# Syntax: url[;option1=value;option2=value]
# Possible options:
# 	* branch=<branch-to-clone>
# 	* subdirs=<subdirectory with meta-layer>[,<subdirectory with meta-layer>]

LAYERS	+= git://git.openembedded.org/meta-openembedded;subdirs=meta-oe,meta-python,meta-networking,meta-filesystems,meta-initramfs,meta-multimedia,meta-perl,meta-webserver

LAYERS 	+= https://github.com/madisongh/meta-tegra.git;branch=${YOCTO_RELEASE}-l4t-r32.5.0;patches=0001-fix-for-python3.5.patch

LAYERS	+= https://github.com/EvoLogics/meta-evo.git

LAYERS	+= https://github.com/sbabic/meta-swupdate

LAYERS	+= git://git.yoctoproject.org/meta-virtualization

# LAYERS  += ../sources/meta-tegra/contrib


# MACHINE_BITBAKE_TARGETS = meta-toolchain ${IMAGE_NAME}:do_populate_sdk ${IMAGE_NAME}:do_populate_sdk_ext
