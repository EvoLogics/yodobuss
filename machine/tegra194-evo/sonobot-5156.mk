include machine/tegra194-evo/default.mk
include machine/append-sw-common/object-recognition.mk
#include machine/append-hw-common/sonobot-tegra.mk
include machine/append-sw-common/collision-avoidance.mk
LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git
# v4l
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " v4l-utils libv4l libv4l-dev "'
#Debug
#LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " gdb packagegroup-core-buildessential cmake python3-smbus"'
#OpenCV
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " db-agent packagegroup-gstreamer dune-4droin-tegra"'
# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT   += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Sonobot number
LOCAL_CONF_OPT   += 'EVOSN = "5156"'
# Add IP Alias
LOCAL_CONF_OPT   += 'IP_ALIAS = "172.16.186.8/24"'
