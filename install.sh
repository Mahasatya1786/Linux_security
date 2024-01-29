#!/bin/bash
apt update
apt install snort apache2 php libapache2-modsecurity libxml2 libxml2-dev libxml2-utils libaprutil1 policycoreutils selinux-utils selinux-basics libaprutil1-dev libapache2-mod-evasive
selinux-activate
sudo mkdir /var/log/mod_evasive
sudo chown www-data:www-data /var/log/mod_evasive/
mkdir /etc/apache2/modsec/
wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.4.tar.gz
tar xvf v3.3.4.tar.gz -C /etc/apache2/modsec
cp /etc/apache2/modsec/coreruleset-3.3.4/crs-setup.conf.example /etc/apache2/modsec/coreruleset-3.3.4/crs-setup.conf
