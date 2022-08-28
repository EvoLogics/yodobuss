include machine/tegra194-evo/default.mk
include machine/append-sw-common/object-recognition.mk

# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT += 'NVPMODEL_CONFIG_DEFAULT = "2"'

LOCAL_CONF_OPT += 'EVOSN = "5008"'
