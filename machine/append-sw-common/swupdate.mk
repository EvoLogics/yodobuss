include machine/append-sw-common/nodejs-native.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

# Install SWUPDATE
LOCAL_CONF_OPT    += 'CORE_IMAGE_EXTRA_INSTALL += "swupdate swupdate-webapp-evo swupdate-hwrevision swupdate-client"'
LOCAL_CONF_OPT 	  += 'PREFERRED_VERSION_swupdate = "2021.04"'
