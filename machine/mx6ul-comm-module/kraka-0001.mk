include machine/mx6ul-comm-module/default.mk
include machine/append-hw-common/kraka-comm.mk
include machine/append-hw-common/sonobot-comm-streamcaster.mk
include machine/append-sw-common/swupdate.mk

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "0001"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS += " gpspps "'

LOCAL_CONF_OPT += 'EXTERNAL_IP="172.16.9.2/16"'