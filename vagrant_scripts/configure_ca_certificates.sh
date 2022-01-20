#!/usr/bin/env bash

# These certificates will be used by TFE after the installation
touch /root/.rnd

mkdir -p /vagrant/certificates
pushd /vagrant/certificates

openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 365 -key ca.key -subj "/C=CN/ST=GD/L=SZ/O=Acme, Inc./CN=Acme Root CA" -out ca.crt

openssl req -newkey rsa:2048 -nodes -keyout server.key -subj "/C=CN/ST=GD/L=SZ/O=Acme, Inc./CN=192.168.56.33.nip.io" -out server.csr
openssl x509 -req -extfile <(printf "subjectAltName=DNS:192.168.56.33.nip.io") -days 365 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt

cp /vagrant/certificates/ca.crt /etc/ssl/certs/
cp /vagrant/certificates/server.crt /etc/ssl/certs/
update-ca-certificates --fresh
