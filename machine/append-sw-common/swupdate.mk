LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

# Install SWUPDATE
LOCAL_CONF_OPT    += 'CORE_IMAGE_EXTRA_INSTALL += "swupdate swupdate-www"'
LOCAL_CONF_OPT 	  += 'PREFERRED_VERSION_swupdate = "2021.04"'
