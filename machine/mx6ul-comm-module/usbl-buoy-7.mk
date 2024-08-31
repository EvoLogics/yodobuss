include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-sw-common/sinaps.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'PREFERRED_VERSION_sinaps = "2.2.6"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "7"'

LOCAL_CONF_OPT += 'EXTERNAL_IP="172.16.7.2/16"'

LOCAL_CONF_OPT += 'INHERIT += " userconfig"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " htop soft-hwclock haproxy"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-usbl-buoy-$${EVOSN} dune-usbl-buoy-$${EVOSN}-etc dune-usbl-buoy-$${EVOSN}-default dune-usbl-buoy-$${EVOSN}-www comm-config"'
# Install for Zerotier VPN
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " zerotier"'
# Install for LTE connection
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " libqmi quectel-cm busybox-udhcpc evo-nat evo-firewall smcroute "'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " mosquitto-clients"'

LOCAL_CONF_OPT += 'hostname_pn-base-files = "usbl-buoy-$${EVOSN}"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " gpspps EC25 streamcaster"'
