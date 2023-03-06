# Image name to build by default
IMAGE_NAME        = core-image-minimal

# MACHINE is a must in local.conf
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
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " haveged iproute2 coreutils grep bridge-utils iputils iperf3 net-tools"'
# Very useful software
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " opkg dropbear bash tar procps util-linux ckermit htop"'
# Useful software
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " netcat-openbsd screen tmux rsync file gzip tar curl chrony soft-hwclock"'
# Hardware tools
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " can-utils i2c-tools pps-tools usbutils ethtool libgpiod pciutils"'
# FAT/exFAT support
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " fuse-exfat e2fsprogs exfat-utils e2fsprogs-resize2fs parted glibc-utils localedef"'
# Init for read-only rootfs
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " evo-envinit"'
# Jetson Module Specific
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " tegra-nvpmodel tegra194-usb-device-mode"'
# Image Update
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " swupdate swupdate-webapp-evo swupdate-client tegra-bup-payload packagegroup-tegra-tools"'
# Read only rootfs
LOCAL_CONF_OPT   += 'EXTRA_IMAGE_FEATURES_append = " package-management read-only-rootfs "'

LOCAL_CONF_OPT   += 'TCLIBC = "glibc"'
# Python prefered version
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_python3 = "3.8%"'
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_python3-native = "3.8%"'
# Swupdate prefered version
LOCAL_CONF_OPT   += 'PREFERRED_VERSION_swupdate = "2021.11"'
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
LOCAL_CONF_OPT   += 'CUDA_GCCVERSION = "8.%"'

LOCAL_CONF_OPT   += 'PACKAGE_CLASSES = "package_ipk"'

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

LAYERS 	+= https://github.com/madisongh/meta-tegra.git;patches=0001-fix-for-python3.5.patch;subdirs=.,contrib

LAYERS	+= https://github.com/EvoLogics/meta-evo.git

LAYERS	+= https://github.com/sbabic/meta-swupdate

LAYERS	+= git://git.yoctoproject.org/meta-virtualization

LAYERS	+= https://github.com/meta-erlang/meta-erlang.git

####### FIXME ######
DOCKER_BIND	+= --privileged=true
DOCKER_BIND	+= -v /var/run/docker.sock:/var/run/docker.sock
DOCKER_BIND	+= -v /etc/group:/etc/group:ro
DOCKER_BIND	+= -v /etc/passwd:/etc/passwd:ro
DOCKER_BIND	+= -v /etc/shadow:/etc/shadow:ro
DOCKER_BIND += -v /home/${USER}/.docker:/home/${USER}/.docker

MACHINE_BITBAKE_TARGETS = meta-toolchain swupdate-images-evo-tegra

