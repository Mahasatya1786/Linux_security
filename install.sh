#!/bin/bash
apt update
apt-get -y install apt-transport-https lsb-release ca-certificates curl
wget -qO - https://modsecurity.digitalwave.hu/archive.key | sudo apt-key add -
 sudo sh -c 'echo "deb http://modsecurity.digitalwave.hu/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/dwmodsec.list'
 sudo sh -c 'echo "deb http://modsecurity.digitalwave.hu/ubuntu/ $(lsb_release -sc)-backports main" >> /etc/apt/sources.list.d/dwmodsec.list'
cat << EOF | sudo tee -a /etc/apt/preferences.d/99modsecurity
Package: *libnginx-mod-http-modsecurity*
Pin: origin modsecurity.digitalwave.hu
Pin-Priority: 900

Package: *libapache2-mod-security2*
Pin: origin modsecurity.digitalwave.hu
Pin-Priority: 900

Package: *modsecurity-crs*
Pin: origin modsecurity.digitalwave.hu
Pin-Priority: 900

Package: *libmodsecurity*
Pin: origin modsecurity.digitalwave.hu
Pin-Priority: 900
EOF
apt update
apt install snort apache2 php libapache2-mod-security2 libxml2 libxml2-dev libxml2-utils libaprutil1 policycoreutils selinux-utils selinux-basics libaprutil1-dev libapache2-mod-evasive
selinux-activate
sudo mkdir /var/log/mod_evasive
mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
sudo chown www-data:www-data /var/log/mod_evasive/
mkdir /etc/apache2/modsec/
wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.4.tar.gz
tar xvf v3.3.4.tar.gz -C /etc/apache2/modsec
cp /etc/apache2/modsec/coreruleset-3.3.4/crs-setup.conf.example /etc/apache2/modsec/coreruleset-3.3.4/crs-setup.conf
