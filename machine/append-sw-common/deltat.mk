# deltat comes from meta-evo-private
LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

# Install necessary packages.
LOCAL_CONF_OPT += 'EVO_BASE_EXTRA_INSTALL += "deltat"'
