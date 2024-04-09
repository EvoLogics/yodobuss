include machine/tegra194-evo/default.mk
include machine/append-sw-common/tegra-signing.mk

# Very useful software
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " ltrace strace kernel-devicetree tcl tcpdump"'

LOCAL_CONF_OPT    += 'hostname_pn-base-files = "production-image"'

LOCAL_CONF_OPT += 'NVPMODEL_CONFIG_DEFAULT = "2"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS += " WIC "'