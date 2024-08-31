include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-hw-common/quadroin.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'EVOSN = "3"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " can enablesw atmclkpps streamcaster"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " smcroute evo-firewall networkd-dispatcher"'

LOCAL_CONF_OPT += 'EXTERNAL_IP="172.16.17.2/16"'
