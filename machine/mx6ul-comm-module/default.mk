# Image name to build by default
IMAGE_NAME          = evologics-base-image-mx

# MACHINE is a must in local.conf
LOCAL_CONF_OPT      = 'MACHINE = "$(MACHINE)"'

LOCAL_CONF_OPT      += 'DISTRO  = "yogurt"'

################ begin build/conf/local.conf options ###################
$(call local_conf_options_begin)

BBMASK_append       = .*karo.*
BBMASK_append       += .*toradex.*
BBMASK_append       += .*at91.*
BBMASK_append       += .*rauc.*
BBMASK_append       += .*meta-yogurt/recipes-qt/.*
BBMASK_append       += .*meta-yogurt/recipes-images/.*
BBMASK_append       += .*meta-yogurt/recipes-examples/.*
BBMASK_append       += .*fsl-image-mfgtool-initramfs.*
BBMASK_append       += .*rebar3.*

# Start recording variables which will go to te local.conf file
# If you want do redefine the variable VAR previously set, first use:
#undefine VAR
# Otherwise it will not be recorded and will not show up in local.conf
OLDVARS := $(sort $(.VARIABLES))

# Select configuration UI for linux and barebox recipe. The openembedd
# default is 'menuconfig', 'nconfig' has more features.
# busybox only supports menuconfig

KCONFIG_CONFIG_COMMAND            = nconfig
KCONFIG_CONFIG_COMMAND_pn-busybox = menuconfig

# Must have for the platform
EVO_BASE_EXTRA_INSTALL      = rng-tools grep bridge-utils	htop
# Very useful software
EVO_BASE_EXTRA_INSTALL      += opkg packagegroup-core-ssh-openssh iptables limitcpu
# Hardware tools
EVO_BASE_EXTRA_INSTALL      += can-utils i2c-tools spitools cannelloni uhubctl
# Useful software
EVO_BASE_EXTRA_INSTALL      += gzip bc kernel-devicetree tcl expect tcpdump ttyd
# FAT/exFAT support
EVO_BASE_EXTRA_INSTALL      += fuse-exfat exfat-utils parted
# Init for read-only rootfs
EVO_BASE_EXTRA_INSTALL      += evo-envinit
# Communication Module Specific
EVO_BASE_EXTRA_INSTALL      += gpsd dt-utils dt-utils-barebox-state soft-hwclock
# Locales
EVO_BASE_EXTRA_INSTALL      += glibc-utils localedef
# Read only rootfs
EXTRA_IMAGE_FEATURES_append = package-management read-only-rootfs
DISTRO_FEATURES_remove      = bluetooth wayland alsa
# Add 100MB Extra to Rootfs
IMAGE_ROOTFS_EXTRA_SPACE    = 100000
# Define what we need
PACKAGE_CLASSES             = package_ipk
TCLIBC                      = glibc
LOCAL_CONF_OPT              += 'INHERIT += " userconfig "'
PRSERV_HOST                 = localhost:0

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

LAYERS	+= https://github.com/EvoLogics/meta-evo.git

LAYERS	+= git://git.openembedded.org/meta-openembedded;subdirs=meta-oe,meta-python,meta-networking,meta-filesystems,meta-initramfs,meta-multimedia,meta-perl,meta-webserver

LAYERS 	+= https://git.phytec.de/meta-phytec

LAYERS	+= https://git.phytec.de/meta-yogurt;patches=0001-remove-dependency-on-qt5-and-rauc.patch

LAYERS	+= https://github.com/sbabic/meta-swupdate

LAYERS	+= https://github.com/meta-erlang/meta-erlang.git

MACHINE_BITBAKE_TARGETS = meta-toolchain swupdate-images-evo-comm


.PHONY: ci-deploy
ci-deploy:
	$(eval CI_DEP_DIR := $(CI_PATH:%/=%)/$(MACHINE)/$(MACHINE_CONFIG))
	mkdir -p $(CI_DEP_DIR)
	cp -L images/barebox.bin $(CI_DEP_DIR)  || exit 1
	cp -L images/swupdate-images-evo-comm-$(MACHINE).swu $(CI_DEP_DIR) || exit 1
