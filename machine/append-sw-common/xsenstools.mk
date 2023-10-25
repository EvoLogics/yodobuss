include machine/append-sw-common/qemu-target.mk

#xsenstool & xsens-mfm come from meta-evo-private
LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

# Install necessary packages.
LOCAL_CONF_OPT += 'EVO_BASE_EXTRA_INSTALL += "xsenstool xsens-mfm"'
