include machine/append-sw-common/erlang.mk
include machine/append-sw-common/nodejs-native.mk

# Install necessary packages.
LOCAL_CONF_OPT += 'EVO_BASE_EXTRA_INSTALL += "sinaps"'
