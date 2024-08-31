include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-hw-common/quadroin.mk

LOCAL_CONF_OPT += 'EVOSN = "1"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " can enablesw atmclkpps streamcaster"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " smcroute evo-firewall networkd-dispatcher"'

LOCAL_CONF_OPT += 'EXTERNAL_IP="172.16.15.2/16"'
