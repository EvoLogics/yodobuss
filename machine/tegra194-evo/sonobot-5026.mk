include machine/tegra194-evo/default.mk
include machine/append-hw-common/sonobot-tegra.mk
include machine/append-sw-common/ros2.mk
include machine/append-sw-common/atr.mk
include machine/append-sw-common/oas.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git
#OpenCV
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " packagegroup-gstreamer packagegroup-opencv packagegroup-tegra-docker "'
# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT   += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Sonobot number
LOCAL_CONF_OPT   += 'EVOSN = "5026"'
# Add IP Alias
LOCAL_CONF_OPT   += 'IP_ALIAS = "172.16.56.8/24"'
