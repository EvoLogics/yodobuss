# Image name to build by default
IMAGE_NAME        = evologics-base-image-mx

# MACHINE is a must in local.conf
LOCAL_CONF_OPT    = 'MACHINE = "$(MACHINE)"'
BUILD_DIR         = build-mio

################ begin build/conf/local.conf options ###################
$(call local_conf_options_begin)

# Define what we need
PACKAGE_CLASSES             = package_ipk
TCLIBC                      = glibc

# Must have for the platform
EVO_BASE_EXTRA_INSTALL      = rng-tools efibootmgr
#grub grub-efi grub-bootconf
# Very useful software
EVO_BASE_EXTRA_INSTALL     += opkg dropbear \
                              update-rc.d \
                              limitcpu
# Useful software
EVO_BASE_EXTRA_INSTALL     += iptables \
                              ttyd \
                              rtklib-cli-str2str zerotier mosquitto-clients sftpgo websocat

# Locales
EVO_BASE_EXTRA_INSTALL     += glibc-utils localedef

# Hardware tools
EVO_BASE_EXTRA_INSTALL     += can-utils cannelloni i2c-tools \
                              spitools avrdude uhubctl \
                              quectel-cm

# Development
EVO_BASE_EXTRA_INSTALL     += tcl expect
# Time management
EVO_BASE_EXTRA_INSTALL     += gpsd-tiny
# FAT/exFAT support
EVO_BASE_EXTRA_INSTALL     += fuse-exfat exfat-utils
# Init for read-only rootfs
EVO_BASE_EXTRA_INSTALL     += evo-envinit

#EVO_BASE_EXTRA_INSTALL    += openssh-client keychain
#EVO_BASE_EXTRA_INSTALL    += ntp kernel-module-pps-gpio

PRSERV_HOST = localhost:0

DISTRO_FEATURES_remove = bluetooth wayland
EXTRA_IMAGE_FEATURES_append = package-management read-only-rootfs
#EXTRA_IMAGE_FEATURES_append = package-management

BBMASK_append  = .*at91.*
BBMASK_append += .*-phy[0-9]\..*
BBMASK_append += .*systemd-conf.*
BBMASK_append += .*rebar3.*

$(call local_conf_options_end)
################ end build/conf/local.conf options #####################

LOCAL_CONF_OPT += 'SKIP_RECIPE[libubootenv] = "Prevents selecting right u-boot-fw-utils"'
#LOCAL_CONF_OPT += 'INHERIT += " userconfig "'

# If layer branch not set with "branch=" option, YOCTO_RELEASE will be used.
# If layer has no such branch, 'master' branch will be used.
YOCTO_RELEASE     = kirkstone

# Layers to download and add to the configuration.
# Layers must me in right order, layers used by other layers must become first.
# Syntax: url[;option1=value;option2=value]
# Possible options:
# 	* branch=<branch-to-clone>
# 	* subdirs=<subdirectory with meta-layer>[,<subdirectory with meta-layer>]
LAYERS           += \
                    git://git.openembedded.org/meta-openembedded;subdirs=meta-oe,meta-python,meta-networking,meta-filesystems \
                    https://github.com/sbabic/meta-swupdate \
                    https://github.com/YoeDistro/meta-intel.git \
                    https://github.com/evologics/meta-evo

#MACHINE_BITBAKE_TARGETS = swupdate-images-evo-mio

#LOCAL_CONF_OPT += 'WKS_FILE = "image-installer.wks.in"'
#LOCAL_CONF_OPT += 'IMAGE_FSTYPES:append = " ext4"'
#LOCAL_CONF_OPT += 'IMAGE_TYPEDEP_wic = "ext4"'
#LOCAL_CONF_OPT += 'INITRD_IMAGE_LIVE="core-image-minimal-initramfs"'
#LOCAL_CONF_OPT += 'do_image_wic[depends] += "$${INITRD_IMAGE_LIVE}:do_image_complete"'
#LOCAL_CONF_OPT += 'do_rootfs[depends] += "virtual/kernel:do_deploy"'
#LOCAL_CONF_OPT += 'IMAGE_BOOT_FILES:append = " \
#	$${KERNEL_IMAGETYPE} \
#	microcode.cpio \
#    $${IMGDEPLOYDIR}/$${IMAGE_BASENAME}-$${MACHINE}.ext4;rootfs.img \
#	systemd-bootx64.efi;EFI/BOOT/bootx64.efi \
#	$${IMAGE_ROOTFS}/boot/loader/loader.conf;loader/loader.conf \
#	$${IMAGE_ROOTFS}/boot/loader/entries/boot.conf;loader/entries/boot.conf"'

#	grub-efi-bootx64.efi;EFI/BOOT/bootx64.efi \
#	$${IMAGE_ROOTFS}/boot/EFI/BOOT/grub.cfg;EFI/BOOT/grub.cfg"'

#	$${@bb.utils.contains(\'EFI_PROVIDER\', \'grub-efi\', \'grub-efi-bootx64.efi;EFI/BOOT/bootx64.efi\', \'\', d)} \
#    $${@bb.utils.contains(\'EFI_PROVIDER\', \'grub-efi\', \'$${IMAGE_ROOTFS}/boot/EFI/BOOT/grub.cfg;EFI/BOOT/grub.cfg\', \'\', d)} \
#    $${@bb.utils.contains(\'EFI_PROVIDER\', \'systemd-boot\', \'systemd-bootx64.efi;EFI/BOOT/bootx64.efi\', \'\', d)} \
#    $${@bb.utils.contains(\'EFI_PROVIDER\', \'systemd-boot\', \'$${IMAGE_ROOTFS}/boot/loader/loader.conf;loader/loader.conf \', \'\', d)} \
#    $${@bb.utils.contains(\'EFI_PROVIDER\', \'systemd-boot\', \'$${IMAGE_ROOTFS}/boot/loader/entries/boot.conf;loader/entries/boot.conf\', \'\', d)} "'

    
