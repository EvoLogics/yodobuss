include machine/tegra194-evo/default.mk
include machine/append-sw-common/object-recognition.mk
include machine/append-hw-common/sonobot-tegra.mk
include machine/append-sw-common/tegra-signing.mk

include machine/append-sw-common/qemu-target.mk
LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

#Debug
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " gdb packagegroup-core-buildessential cmake "'
#OpenCV
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " db-agent packagegroup-opencv "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " packagegroup-gstreamer wic-sdk wic-sdk-dev"'
# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT   += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Sonobot number
LOCAL_CONF_OPT   += 'EVOSN = "5079"'
# Add IP Alias
LOCAL_CONF_OPT   += 'IP_ALIAS = "172.16.109.8/24"'

LOCAL_CONF_OPT   += 'IMAGE_CONFIGS += " WIC "'
LOCAL_CONF_OPT   += 'TOOLCHAIN_TARGET_TASK += "wic-sdk wic-sdk-dev gstreamer1.0-dev gstreamer1.0-plugins-base-dev"'
# LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " dune-sonobot-tegra-wic "'
