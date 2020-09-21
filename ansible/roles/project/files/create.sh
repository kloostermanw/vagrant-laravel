#! /bin/bash

openssl req \
   -newkey rsa:2048 \
   -x509 \
   -nodes \
   -keyout star.wiebekn.dev.key \
   -new \
   -out star.wiebekn.dev.crt \
   -subj /CN=*.wiebekn.dev \
   -reqexts SAN \
   -extensions SAN \
   -config <(cat /etc/pki/tls/openssl.cnf ; printf '[SAN]\nsubjectAltName=DNS:*.wiebekn.dev') \
   -sha256 \
   -days 3650

cp star.wiebekn.dev.crt /etc/pki/tls/certs/star.wiebekn.dev.crt
cp star.wiebekn.dev.key /etc/pki/tls/private/star.wiebekn.dev.key
