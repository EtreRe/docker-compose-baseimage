FROM etrere/baseimage-flatten:latest

ENV \
  HOME /root \
  DEBIAN_FRONTEND noninteractive

RUN \
  rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  locale-gen fr_FR.UTF-8 && \
  export LANG=fr_FR.UTF-8 && \
  add-apt-repository ppa:ondrej/php5-5.6 && \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y php5 php5-fpm php5-cli php5-mysqlnd php5-mcrypt php5-gd php5-imagick php5-pgsql php5-sqlite php5-curl php5-intl php5-imap php5-tidy \
   php5-memcache php5-memcached curl  && \
  sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini && \
  sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini && \
  sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini && \
  sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
  sed -i '/^listen = /clisten = 9000' /etc/php5/fpm/pool.d/www.conf && \
  sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php5/fpm/pool.d/www.conf && \
  sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php5/fpm/pool.d/www.conf && \
  mkdir /etc/service/phpfpm && \
  echo "#!/usr/bin/env bash\n\nphp5-fpm -c /etc/php5/fpm" > /etc/service/phpfpm/run && \
  chmod +x /etc/service/phpfpm/run && \
  apt-get clean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/home/http"]

WORKDIR /home/http

EXPOSE 9000

CMD ["/sbin/my_init"]