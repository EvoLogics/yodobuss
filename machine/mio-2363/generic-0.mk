# Board defaults
include machine/mio-2363/default.mk

# Evohw common defs (incl. dune)
#include machine/append-hw-common/evohw.mk
# Evohw common defs (no dune)
include machine/append-hw-common/evohw-nd.mk

# Software common defs
#include machine/append-sw-common/deltat.mk
include machine/append-sw-common/docker.mk
#include machine/append-sw-common/dune.mk
#include machine/append-sw-common/evotools.mk
#include machine/append-sw-common/evohw-defs.mk
#include machine/append-sw-common/hyscan.mk
#include machine/append-sw-common/nodejs-native.mk
#include machine/append-sw-common/qemu-target.mk
include machine/append-sw-common/sinaps.mk
#include machine/append-sw-common/swupdate.mk
#include machine/append-sw-common/xsenstools.mk

# Vehicle type and SN
LOCAL_CONF_OPT += 'EVOHW = "generic"'
LOCAL_CONF_OPT += 'EVOSN = "0"'
