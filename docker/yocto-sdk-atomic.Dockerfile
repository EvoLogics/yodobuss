FROM debian:bullseye

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
    coreutils xz-utils gcc make python3-minimal perl-base findutils file git \
    && \
    rm -rf /var/lib/apt/lists/*

ADD sdk /tmp
RUN chmod +x /tmp/sdk && \
    /tmp/sdk -y -p | tee /tmp/sdk.log

ADD yocto-sdk-atomic.entrypoint.sh /entrypoint.sh
RUN export SRCENV=$(tail -n1 /tmp/sdk.log | sed 's/\ $ //') && \
    sed -i "s|#SRCENV#|${SRCENV}|" /entrypoint.sh \
    && \
    rm -rf /tmp/sdk*

ENTRYPOINT ["/entrypoint.sh"]
