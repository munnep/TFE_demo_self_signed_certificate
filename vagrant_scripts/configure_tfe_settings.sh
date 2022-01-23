#!/usr/bin/env bash

cat <<-CONF > /vagrant/config/tfe_settings.json
{
    "enc_password": {
        "value": "Password#1"
    },
    "hostname": {
        "value": "192.168.56.33.nip.io"
    },
    "installation_type": {
        "value": "poc"
    }
}
CONF

chmod 600 /vagrant/config/tfe_settings.json