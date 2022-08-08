LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git
LAYERS += https://git.yoctoproject.org/meta-java
#Install docker and object recognition software
LOCAL_CONF_OPT    += 'IMAGE_INSTALL_append = "	packagegroup-tegra-docker object-recognition"'
#Install Java
# Possible provider: cacao-initial-native and jamvm-initial-native
#LOCAL_CONF_OPT    += 'PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"'
# # Possible provider: cacao-native and jamvm-native
#LOCAL_CONF_OPT    += 'PREFERRED_PROVIDER_virtual/java-native = "cacao-native"'
#LOCAL_CONF_OPT    += 'PREFERRED_PROVIDER_java2-runtime = " openjdk-8-jre"'
#LOCAL_CONF_OPT    += 'IMAGE_INSTALL_append = " openjdk-8"'

