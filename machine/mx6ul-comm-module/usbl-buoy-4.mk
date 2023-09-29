include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-sw-common/sinaps.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'PREFERRED_VERSION_sinaps = "2.2.6"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "prod"'

LOCAL_CONF_OPT += 'BRIDGE_ADDRESS="192.168.0.2/24"'

LOCAL_CONF_OPT += 'INHERIT += " userconfig"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " htop soft-hwclock haproxy"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-usbl-buoy-4 dune-usbl-buoy-4-etc dune-usbl-buoy-4-default dune-usbl-buoy-4-www comm-config"'
# Install for Zerotier VPN
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " zerotier"'
# Install for RTCM Streaming
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " rtklib-cli-str2str"'
# Install for LTE connection
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " libqmi quectel-cm busybox-udhcpc"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " mosquitto-clients"'

LOCAL_CONF_OPT += 'hostname_pn-base-files = "usbl-buoy-$${EVOSN}"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " gpspps EC25"'
