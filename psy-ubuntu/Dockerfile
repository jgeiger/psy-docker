FROM ubuntu:14.04
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
  apt-get -qq -y upgrade && \
  apt-get -qq -y dist-upgrade && \
  dpkg-reconfigure tzdata && \
  dpkg-divert --local --rename --add /sbin/initctl && \
  ln -sf /bin/true /sbin/initctl && \
  dpkg-divert --local --rename --add /usr/bin/ischroot && \
  ln -sf /bin/true /usr/bin/ischroot && \
  apt-get -qq -y install -y wget git unzip language-pack-en software-properties-common && \
  locale-gen en_US && \
  echo "LANG=en_US.UTF-8" > /etc/default/locale && \
  apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
