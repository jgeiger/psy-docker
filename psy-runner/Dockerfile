FROM jgeiger/psy-base:latest
MAINTAINER jgeiger@gmail.com

# Let's start with some basic stuff.
RUN wget -qO- https://get.docker.io/gpg | apt-key add - && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list && \
apt-get update -qq && \
apt-get install -qqy iptables ca-certificates lxc apt-transport-https git lxc-docker && \
apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install the magic wrapper.
ADD ./wrapdocker.sh /usr/local/bin/wrapdocker
ADD ./start.sh /start
RUN chmod 755 /start && \
usermod -a -G docker psy && \
chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker

USER psy

CMD ["/start"]
