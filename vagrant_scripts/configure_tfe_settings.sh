#!/usr/bin/env bash

cat <<-CONF > /vagrant/config/tfe_settings.json
{
    "backup_token": {
        "value": "3e69c0572c1eddf7f232cf60f6b8634194bf40d09aa9535c78430e64df407ec4"
    },
    "capacity_concurrency": {
        "value": "10"
    },
    "capacity_cpus": {
        "value": "0"
    },
    "capacity_memory": {
        "value": "512"
    },
    "disk_path": {},
    "enable_active_active": {
        "value": "0"
    },
    "enable_metrics_collection": {
        "value": "1"
    },
    "enc_password": {
        "value": "Password#1"
    },
    "force_tls": {
        "value": "0"
    },
    "hairpin_addressing": {
        "value": "0"
    },
    "hostname": {
        "value": "192.168.56.33.nip.io"
    },
    "installation_type": {
        "value": "poc"
    },
    "restrict_worker_metadata_access": {
        "value": "0"
    }
}
CONF

chmod 600 /vagrant/config/tfe_settings.json