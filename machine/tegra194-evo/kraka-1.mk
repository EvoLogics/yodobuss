include machine/tegra194-evo/default.mk
#include machine/append-sw-common/tegra-signing.mk

# Enable all 6 cores by setting nvpmodule to mode 2
LOCAL_CONF_OPT += 'NVPMODEL_CONFIG_DEFAULT = "2"'
# Hostname
LOCAL_CONF_OPT    += 'hostname_pn-base-files = "Kraka-0001"'