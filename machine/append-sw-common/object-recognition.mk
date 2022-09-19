LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git
LAYERS += https://git.yoctoproject.org/meta-java

#Install docker and object recognition software
LOCAL_CONF_OPT    += 'IMAGE_INSTALL_append = " object-detector object-detector-monitor vsftpd "'

LOCAL_CONF_OPT    += 'hostname_pn-base-files = "sonobot-$${EVOSN}-tegra"'
