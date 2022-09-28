# Required layer
LAYERS += https://github.com/meta-erlang/meta-erlang.git;branch=zeus

# Erlang OTP21
LOCAL_CONF_OPT += 'PREFERRED_VERSION_erlang = "21.1%"'
LOCAL_CONF_OPT += 'PREFERRED_VERSION_erlang-native = "21.1%"'
