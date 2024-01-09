FROM i386/debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN printf 'APT::Install-Recommends "0";\nAPT::Install-Suggests "0";\n' > \
    /etc/apt/apt.conf.d/000main \
    && \
    apt-get update -y && apt-get install -y locales

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen \
    && \
    apt-get install -y \
    ca-certificates \
    coreutils xz-utils gcc cmake make python3-minimal perl-base findutils file git \
    && \
    apt-get install -y qemu-user-static && \
    cp `which qemu-arm-static` /usr/local/bin/ && \
    apt-get purge -y qemu-user-static \
    && \
    echo '#!/bin/sh' > /usr/local/bin/qemu-arm-workaround && \
    echo '/usr/local/bin/qemu-arm-static -B 0x20000 $@' >> /usr/local/bin/qemu-arm-workaround && \
    chmod +x /usr/local/bin/qemu-arm-workaround \
    && \
    rm -rf /var/lib/apt/lists/*

ADD vab-800-toolchain.tar.xz /

ADD vab-800-sdk-atomic.entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
