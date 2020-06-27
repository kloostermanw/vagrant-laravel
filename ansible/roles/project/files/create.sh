#! /bin/bash

openssl req \
   -newkey rsa:2048 \
   -x509 \
   -nodes \
   -keyout star.kloos.dev.key \
   -new \
   -out star.kloos.dev.crt \
   -subj /CN=*.kloos.dev \
   -reqexts SAN \
   -extensions SAN \
   -config <(cat /etc/pki/tls/openssl.cnf ; printf '[SAN]\nsubjectAltName=DNS:*.kloos.dev') \
   -sha256 \
   -days 3650

cp star.kloos.dev.crt /etc/pki/tls/certs/star.kloos.dev.crt
cp star.kloos.dev.key /etc/pki/tls/private/star.kloos.dev.key
