include machine/tegra194-evo/default.mk

# Very useful software
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " ltrace strace kernel-devicetree tcl tcpdump"'

LOCAL_CONF_OPT    += 'hostname_pn-base-files = "production-image"'

