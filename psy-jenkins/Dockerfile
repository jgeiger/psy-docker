FROM jgeiger/psy-ubuntu:latest
MAINTAINER jgeiger@gmail.com

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV JENKINS_HOME /var/lib/jenkins
ADD start /start

RUN echo 'deb http://pkg.jenkins-ci.org/debian binary/' > /etc/apt/sources.list.d/jenkins.list && \
wget --quiet -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
wget -qO- https://get.docker.io/gpg | apt-key add - && \
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list && \
apt-get update && \
apt-get -qq -y install openjdk-7-jre-headless jenkins git lxc-docker && \
usermod -a -G docker jenkins && \
usermod -a -G users jenkins && \
chmod 755 /start && \
apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/start"]

EXPOSE 8080
