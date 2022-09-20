# Needed for SSD Encryption 
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " cryptsetup evo-envinit-crypt"'
# Bundle Initramfs
LOCAL_CONF_OPT   += 'INITRAMFS_IMAGE_BUNDLE = "1"'
# Encyption keys
LOCAL_CONF_OPT   += 'TEGRA_SIGNING_ARGS = "-u /work/private/tegra194-evo-priv.pem -v /work/private/tegra194-evo-sbk --user_key /work/private/tegra194-evo-uk "'
