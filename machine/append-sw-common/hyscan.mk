# HyScan layer.
LAYERS += git@gitlab.evologics.de:bsp/meta-hyscan.git

# Install necessary packages.
LOCAL_CONF_OPT += 'EVO_BASE_EXTRA_INSTALL += "hyscansonarproxyd hyscanhydra4drv hyscannmeadrv"'
