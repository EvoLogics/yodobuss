
LAYERS += https://github.com/tuxable-ltd/meta-scipy

LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = "  python3 python3-numpy python3-bitstring "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = "  python3-ifaddr  python3-cmapy python3-utm "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = "  python3-scipy python3-transforms3d python3-opencv python3-pygeodesy python3-kaitaistruct python3-pycuda "'

#ros2 OAS
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " imc-ros-bridge "'



