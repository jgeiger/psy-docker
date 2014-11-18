FROM jgeiger/psy-ubuntu:latest
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND noninteractive

USER root

# install nginx, SSL certs, enabled sites
RUN add-apt-repository ppa:nginx/development && \
apt-get -qq update && \
apt-get -y -qq install nginx && \
chown -R www-data:www-data /var/lib/nginx && \
rm -rf /etc/nginx/nginx.conf && \
apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/htpasswd"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80

# add config files
ADD config/nginx.conf /etc/nginx/
ADD config/mime.types /etc/nginx/
ADD config/basic.conf /etc/nginx/
