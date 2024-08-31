include machine/mx6ul-comm-module/default.mk
include machine/append-hw-common/sonobot-comm.mk
include machine/append-sw-common/swupdate.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "5002"'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " smcroute evo-firewall networkd-dispatcher"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " gpspps can enablesw atmclkpps streamcaster"'

LOCAL_CONF_OPT += 'EXTERNAL_IP="172.16.32.2/16"'
