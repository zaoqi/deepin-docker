FROM alpine
RUN mkdir /rootfs &&
  wget -O - https://github.com/bestwu/docker-deepin/raw/f3078c226c25937970d2c368d7a577b7ed4e5f35/amd64/rootfs.tar.xz | tar -xJvC /rootfs

FROM scratch
COPY --from=0 /rootfs /

ENV TERM=xterm \
    DEBIAN_FRONTEND=noninteractive

RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    sed -i "s/mesg n/tty -s \&\& mesg n/" /root/.profile && \
    apt-get update && \
    apt --fix-broken -y install && \
    apt-get -y autoremove --purge && apt-get autoclean -y && apt-get clean -y && \
    find /var/lib/apt/lists -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f -delete && \
    find /usr/share/doc -type f -delete && \
    find /usr/share/man -type f -delete

RUN apt-get update && \
  env DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade && \
  env DEBIAN_FRONTEND=noninteractive apt-get -y autoremove && \
  apt-get clean && rm -rf /var/cache/apt/archives/* && \
  rm -rf /var/lib/apt/lists/*
