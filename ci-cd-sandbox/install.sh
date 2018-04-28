#!/bin/bash

mkdir /var/docker-volumes

chmod +rw docker_ubuntu_install.sh

#Docker installation
../docker/docker_ubuntu_install

#Installing MySQL Database & client
apt install mysql-client
docker pull mysql:5.7

mkdir /var/docker-volumes/mysql
chmod 777 /var/docker-volumes/mysql

docker run --restart always --name mysql -d -p 3306:3306 -v /var/docker-volumes/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret mysql:5.7

#Installation de gogs
docker pull gogs/gogs

mkdir /var/docker-volumes/gogs
chmod 777 /var/docker-volumes/gogs

mysql --host=127.0.0.1 --password=secret < sql/create_gogs_database.sql

docker run --restart always --name gogs -d -p 3000:3000 -p 10022:22 -v /var/docker-volumes/gogs:/data gogs/gogs

#Installation de sonarqube
mysql --host=127.0.0.1 --password=secret < sql/create_sonar_database.sql
