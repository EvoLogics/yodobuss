LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " zerotier networkd-dispatcher libcurl"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS += " iridium "'
