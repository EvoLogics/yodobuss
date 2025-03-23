include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-sw-common/qemu-target.mk
include machine/append-sw-common/sinaps.mk

LOCAL_CONF_OPT += 'hostname_pn-base-files = "production-comm-image"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " can enablesw gpspps EC25"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-production-comm dune-production-comm-etc dune-production-comm-default comm-config "'

LOCAL_CONF_OPT += 'INHERIT += " userconfig"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'
# Install for Zerotier VPN
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " zerotier"'
# Install for LTE connection
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " libqmi quectel-cm busybox-udhcpc evo-nat evo-firewall smcroute "'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " mosquitto-clients"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " htop soft-hwclock haproxy"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " mosquitto-clients"'

#LOCAL_CONF_OPT += 'PREFERRED_VERSION_sinaps = "2.2.6"'
