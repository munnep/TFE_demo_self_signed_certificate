#!/usr/bin/env bash

# TODO
# copy file to some destination at the computer.
# set permissions

chmod 600 /vagrant/config/license.rli

curl -o /var/tmp/install.sh https://install.terraform.io/ptfe/stable

bash /var/tmp/install.sh \
    no-proxy \
    private-address=192.168.56.33 \
    public-address=192.168.56.33
