include machine/append-sw-common/qemu-target.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-sonobot-tegra-$${EVOSN} dune-sonobot-tegra-$${EVOSN}-etc dune-sonobot-tegra-$${EVOSN}-default dune-sonobot-tegra-$${EVOSN}-www"'
