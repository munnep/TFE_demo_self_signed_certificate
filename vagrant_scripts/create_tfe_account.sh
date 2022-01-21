#!/usr/bin/env bash

# We have to wait for TFE be fully functioning before we can continue
while true; do
    if curl -I "https://192.168.56.33.nip.io/admin" 2>&1 | grep -w "200\|301" ; 
    then
        echo "TFE is up and running"
        echo "Will continue in 1 minutes with the final steps"
        sleep 60
        break
    else
        echo "TFE is not available yet. Please wait..."
        sleep 60
    fi
done

cat <<-CONF > /vagrant/config/create_tfe_user.json
{
    "username": "admin",
    "email": "it@mycompany.com",
    "password": "Password#1"
}
CONF




pushd /vagrant/config

initial_token=$(/usr/local/bin/replicated admin --tty=0 retrieve-iact | tr -d '\r')

curl \
  --header "Content-Type: application/json" \
  --request POST \
  --data @create_tfe_user.json \
  https://192.168.56.33.nip.io/admin/initial-admin-user?token=$initial_token

echo ""
echo "#######################################################"
echo "#              TFE installation complete              #"
echo "# TFE dashboard: https://192.168.56.33.nip.io:8800    #"
echo "# TFE Application: https://192.168.56.33.nip.io       #" 
echo "#######################################################"