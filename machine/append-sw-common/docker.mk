# Required layer
LAYERS += git://git.yoctoproject.org/meta-virtualization

LOCAL_CONF_OPT += 'DISTRO_FEATURES_append = " virtualization "'
LOCAL_CONF_OPT += 'PREFERRED_PROVIDER_virtual/docker = "docker-moby"'
LOCAL_CONF_OPT += 'EVO_BASE_EXTRA_INSTALL += "docker python3-docker-compose python3-distutils"'
