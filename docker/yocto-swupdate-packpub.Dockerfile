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
    coreutils xz-utils gcc make python3-minimal perl-base findutils file \
    && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \
    apt-get install -y \
    git openssh-client openssl rsync wget python3-pip unzip && \
    rm -rf /var/lib/apt/lists/*

RUN git -c advice.detachedHead=false clone https://github.com/sbabic/swugenerator.git /tmp/swugenerator

RUN pip3 install testresources==2.0.1 && \
    pip3 install /tmp/swugenerator && \
    rm -rf /root/.cache/pip && \
    rm -rf /tmp/swugenerator

