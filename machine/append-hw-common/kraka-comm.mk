include machine/append-sw-common/qemu-target.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " comm-config "'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-kraka-comm-$${EVOSN} dune-kraka-comm-$${EVOSN}-etc dune-kraka-comm-$${EVOSN}-default dune-kraka-comm-$${EVOSN}-www"'

LOCAL_CONF_OPT += 'hostname_pn-base-files = "kraka-$${EVOSN}-comm"'

LOCAL_CONF_OPT += 'IMAGE_CONFIGS += " can"'
