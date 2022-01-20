#!/usr/bin/env bash

cat <<-CONF > /etc/replicated.conf
{
    "DaemonAuthenticationType":     "password",
    "DaemonAuthenticationPassword": "Password#1",
    "TlsBootstrapType":             "server-path",
    "TlsBootstrapHostname":         "192.168.56.33.nip.io",
    "TlsBootstrapCert":             "/vagrant/certificates/server.crt",
    "TlsBootstrapKey":              "/vagrant/certificates/server.key",
    "BypassPreflightChecks":        true,
    "ImportSettingsFrom":           "/vagrant/config/settings.json",
    "LicenseFileLocation":          "/vagrant/config/license.rli"
}
CONF

chmod 600 /etc/replicated.conf