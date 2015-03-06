FROM etrere/baseimage-flatten:latest

ENV \
  HOME /root \
  DEBIAN_FRONTEND noninteractive

RUN \
  rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  locale-gen fr_FR.UTF-8 && \
  export LANG=fr_FR.UTF-8 && \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y memcached  && \
  mkdir /etc/service/memcached && \
  echo "#!/usr/bin/env bash\n\nexec /sbin/setuser memcache /usr/bin/memcached -v -m 64 -p 11211 -u nobody >>/var/log/memcached.log 2>&1" > /etc/service/memcached/run && \
  chmod +x /etc/service/memcached/run && \
  apt-get clean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/home/http"]

WORKDIR /home/http

EXPOSE 11211

CMD ["/sbin/my_init"]