include machine/tegra194-evo/default.mk
include machine/append-sw-common/object-recognition.mk
include machine/append-sw-common/tegra-signing.mk

LOCAL_CONF_OPT   += 'LICENSE_FLAGS_WHITELIST_append = " commercial_gstreamer1.0-omx-tegra"'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " gstreamer1.0 gstreamer1.0-omx-tegra gstreamer1.0-plugins-good gstreamer1.0-plugins-base gstreamer1.0-rtsp-server gstreamer1.0-vaapi "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " db-agent "'
# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT   += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Sonobot number
LOCAL_CONF_OPT   += 'EVOSN = "5010"'
# Add IP Alias
LOCAL_CONF_OPT   += 'IP_ALIAS = "172.16.40.8/24"'
