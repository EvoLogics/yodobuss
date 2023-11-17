FROM archlinux:latest

RUN pacman -Sy --noconfirm && pacman -S --noconfirm \
    gcc make cmake git \
    && \
    find /var/cache/pacman/ -type f -delete
