# Needed for SSD Encryption 
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " cryptsetup keystore-tools keystore-tools-eksgen keystore"'
# Encyption keys
LOCAL_CONF_OPT   += 'TEGRA_SIGNING_ARGS = "-u /work/private/tegra194-evo-priv.pem -v /work/private/tegra194-evo-sbk"'

