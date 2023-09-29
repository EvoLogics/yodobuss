include machine/append-sw-common/erlang.mk
include machine/append-sw-common/nodejs-native.mk

# SiNAPS lives in meta-evo-private
LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

# Install necessary packages.
LOCAL_CONF_OPT += 'CORE_IMAGE_EXTRA_INSTALL += "sinaps pure-ftpd"'
