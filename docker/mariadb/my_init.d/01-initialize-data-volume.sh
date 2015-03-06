#!/bin/bash

if [[ ! -d /var/lib/mysql/mysql ]]; then
  mkdir -p /var/lib/mysql
  chown -R mysql:mysql /var/lib/mysql
  /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
  touch /var/lib/mysql/initialized
fi