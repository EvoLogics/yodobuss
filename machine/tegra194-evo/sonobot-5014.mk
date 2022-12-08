include machine/tegra194-evo/default.mk
include machine/append-sw-common/object-recognition.mk

LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " db-agent"'
# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT   += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Sonobot number
LOCAL_CONF_OPT   += 'EVOSN = "5014"'
# Add IP Alias
LOCAL_CONF_OPT   += 'IP_ALIAS = "172.16.44.8/24"'
