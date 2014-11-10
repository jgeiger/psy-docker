FROM jgeiger/psy-ubuntu:latest
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN useradd --create-home --shell /bin/bash psy && \
echo "psy ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers && \
chown -R psy:psy /usr/local
USER psy

# add ssh keys for github and gitosis
RUN mkdir /home/psy/.ssh && \
chmod 700 /home/psy/.ssh

ADD ./ssh/config /home/psy/.ssh/config

USER root
RUN chown -R psy:psy /home/psy
