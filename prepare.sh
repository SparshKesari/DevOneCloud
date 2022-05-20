#!/bin/bash

mkdir /etc/config
if [[ "$1" != "" ]]
then
        curl $(echo $1 | base64 -d) -o /etc/config/main.tf
else
        echo "Enter the encoded url"
        read url
        curl $( echo $url | base64 -d ) -o /etc/config/main.tf
fi

cd /etc/config
terraform init
terraform plan
