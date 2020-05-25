include machine/append-sw-common/qemu-target.mk

LAYERS += $(SOURCES_DIR)/meta-evo-private

LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " dune-kalisalz-comm-${EVOSN} dune-kalisalz-comm-${EVOSN}-etc dune-kalisalz-comm-${EVOSN}-default" '

LOCAL_CONF_OPT += 'hostname_pn-base-files = "kalisalz-buoy-$${EVOSN}"'

LOCAL_CONF_OPT += 'BRIDGE_ADDRESS="192.168.$${EVOSN}.2"'

LOCAL_CONF_OPT += 'BRIDGE_GATEWAY="192.168.$${EVOSN}.1"'