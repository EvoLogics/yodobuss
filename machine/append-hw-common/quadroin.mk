include machine/append-sw-common/qemu-target.mk

LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-quadroin-$${EVOSN} dune-quadroin-$${EVOSN}-etc dune-quadroin-$${EVOSN}-default "'

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " libevocanopen xsenstool cannelloni"'

LOCAL_CONF_OPT += 'hostname_pn-base-files = "quadroin-$${EVOSN}"'