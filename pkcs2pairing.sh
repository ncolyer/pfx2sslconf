#!/bin/bash

# Vars
F_IN="acme.pfx"
F_OUT="acme"

#  SSLCertificateFile /etc/httpd/conf/ssl/acme.cer
openssl pkcs12 -in $F_IN -clcerts -nokeys -out $F_OUT.cer
mv $F_OUT.cer /etc/httpd/conf/ssl/

#  SSLCertificateKeyFile /etc/httpd/conf/ssl/acme.key
openssl pkcs12 -in $F_IN -nocerts -nodes -out $F_OUT.key
mv $F_OUT.key /etc/httpd/conf/ssl/

#  SSLCertificateChainFile /etc/httpd/conf/ssl/acme.crt
openssl pkcs12 -in $F_IN -out $F_OUT.crt -nodes -nokeys -cacerts
mv $F_OUT.crt /etc/httpd/conf/ssl/

# Reboot HTTPD Service
service httpd restart
