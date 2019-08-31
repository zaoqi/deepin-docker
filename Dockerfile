FROM bestwu/deepin:panda

ENV LANG en_US.utf8
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/games:/usr/games

# choose a mirror
#RUN echo "deb http://packages.deepin.com/deepin/ panda main non-free contrib" > /etc/apt/sources.list
RUN echo "deb http://mirrors.kernel.org/deepin/  panda main non-free contrib" > /etc/apt/sources.list
#RUN echo "deb http://ftp.fau.de/deepin/          panda main non-free contrib" > /etc/apt/sources.list

RUN apt-get update && \
  env DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade && \
  env DEBIAN_FRONTEND=noninteractive apt-get -y autoremove && \
  apt-get clean && rm -rf /var/cache/apt/archives/* && \
  rm -rf /var/lib/apt/lists/*
