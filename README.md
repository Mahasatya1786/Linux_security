# Linux_security

 run first "sed -i -e 's/\r$//' install.sh"

 chmod +x  install.sh
set apache patching header guide
https://webdock.io/en/docs/how-guides/security-guides/how-to-configure-security-headers-in-nginx-and-apache

./install.sh
change SecRuleEngine to On /etc/modsecurity/modsecurity.conf

change /etc/apache2/mods-enabled/modsecurity.conf

Include /etc/apache2/modsec/coreruleset-3.3.4/crs-setup.conf

Include /etc/apache2/modsec/coreruleset-3.3.4/rules/*.conf

IncludeOptional /usr/share/modsecurity-crs/*.load
