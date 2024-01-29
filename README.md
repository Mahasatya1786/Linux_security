# Linux_security
change SecRuleEngine to On /etc/modsecurity/modsecurity.conf
change /etc/apache2/security.conf
Include /etc/apache2/modsec/coreruleset-3.3.4/crs-setup.conf
Include /etc/apache2/modsec/coreruleset-3.3.4/rules/*.conf
IncludeOptional /usr/share/modsecurity-crs/*.load
