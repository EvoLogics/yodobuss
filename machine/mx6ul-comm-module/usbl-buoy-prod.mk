include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-hw-common/usbl-buoy-comm-production.mk

LOCAL_CONF_OPT += 'PREFERRED_VERSION_sinaps = "2.2.6"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "prod"'

LOCAL_CONF_OPT += 'BRIDGE_ADDRESS="192.168.0.2/24"'

LOCAL_CONF_OPT += 'BRIDGE_GATEWAY="192.168.0.1"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " gpspps EC25"'

# Install for Zerotier VPN
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " zerotier"'
# Install for LTE connection
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " libqmi quectel-cm busybox-udhcpc evo-nat evo-firewall smcroute iptables-persistent "'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " mosquitto-clients"'

#LOCAL_CONF_OPT += 'RDEPENDS_append = " openssh"'

LOCAL_CONF_OPT += 'PREFERRED_VERSION_openssh = "9.9p1"'

LOCAL_CONF_OPT += 'PACKAGECONFIG_pn-openssh_append = "systemd-sshd-socket-mode"'

