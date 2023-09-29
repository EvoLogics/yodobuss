include machine/mx6ul-comm-module/default.mk
include machine/append-sw-common/swupdate.mk
include machine/append-hw-common/usbl-buoy-comm-production.mk

LOCAL_CONF_OPT += 'PREFERRED_VERSION_sinaps = "2.2.4"'

LOCAL_CONF_OPT += 'HW_REVISION = "2.0"'

LOCAL_CONF_OPT += 'EVOSN = "1834H-15023"'

LOCAL_CONF_OPT += 'BRIDGE_ADDRESS="192.168.0.2/24"'

LOCAL_CONF_OPT += 'BRIDGE_GATEWAY="192.168.0.1"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS = " gpspps"'
