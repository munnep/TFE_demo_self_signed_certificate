#!/usr/bin/env bash

chmod 600 /vagrant/config/license.rli

curl -o install.sh https://install.terraform.io/ptfe/stable
bash ./install.sh \
    no-proxy \
    private-address=192.168.56.33 \
    public-address=192.168.56.33
