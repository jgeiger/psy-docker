FROM jgeiger/psy-base:latest
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
apt-get -y -qq install build-essential git libssl-dev libffi-dev \
libreadline-dev libgdbm-dev libpq-dev libxslt-dev libxml2-dev libyaml-dev \
zlib1g-dev libcurl4-openssl-dev && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER psy

ENV CONFIGURE_OPTS --disable-install-doc
ENV PATH /home/psy/.rbenv/bin:/home/psy/.rbenv/shims:$PATH
ENV LANG en_US.UTF-8

ADD ./ruby/ruby_versions.txt /home/psy/ruby_versions.txt

# Install rbenv and ruby-build
# Install multiple versions of ruby
# Install bundler for all versions of ruby
# never install a ruby gem docs
RUN git clone https://github.com/sstephenson/rbenv.git /home/psy/.rbenv && \
git clone https://github.com/sstephenson/ruby-build.git /home/psy/.rbenv/plugins/ruby-build && \
/home/psy/.rbenv/plugins/ruby-build/install.sh && \
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
echo PATH=$PATH && \
rbenv init - && \
echo "gem: --no-rdoc --no-ri" >> ~/.gemrc && \
xargs -L 1 rbenv install < /home/psy/ruby_versions.txt && \
bash -l -c 'for v in $(cat /home/psy/ruby_versions.txt); do rbenv global $v; gem install bundler; rbenv rehash; done'
