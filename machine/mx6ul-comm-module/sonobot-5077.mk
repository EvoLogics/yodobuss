include machine/mx6ul-comm-module/default.mk
include machine/append-hw-common/sonobot-comm.mk
include machine/append-hw-common/sonobot-comm-streamcaster.mk
include machine/append-hw-common/sonobot-comm-iridium.mk
include machine/append-sw-common/swupdate.mk

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "5077"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS += " gpspps "'

LOCAL_CONF_OPT += 'EXTERNAL_IP="172.16.107.2/16"'

LOCAL_CONF_OPT += 'EXTERNAL_GATEWAY="172.16.107.2"'