include machine/append-sw-common/dune.mk

LOCAL_CONF_OPT += 'MACHINEOVERRIDES =. "$${EVOHW}:$${EVOHW}-$${EVOSN}:"' \
                  'CORE_IMAGE_EXTRA_INSTALL += "dune-$${EVOHW}-$${EVOSN} dune-$${EVOHW}-$${EVOSN}-etc dune-$${EVOHW}-$${EVOSN}-default "' \
                  'hostname_pn-base-files = "$${EVOHW}-$${EVOSN}"'
