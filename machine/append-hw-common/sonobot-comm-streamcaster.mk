LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " smcroute evo-firewall networkd-dispatcher"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS += " streamcaster "'
