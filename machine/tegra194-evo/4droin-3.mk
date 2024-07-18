include machine/tegra194-evo/default.mk
#include machine/append-sw-common/tegra-signing.mk

# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Hostname
LOCAL_CONF_OPT    += 'hostname_pn-base-files = "4Droin-3-tegra"'
# v4l
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " v4l-utils libv4l libv4l-dev "'
#Debug
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " gdb packagegroup-core-buildessential cmake python3-smbus"'
#OpenCV
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " packagegroup-gstreamer dune-4droin-tegra"'
