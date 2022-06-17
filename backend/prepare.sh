#!/bin/bash
if [[ "$1" != "" ]]
then
        #curl $(echo $1 | base64 -d) | jq -r '.file' >>  /etc/config/main.tf
	mv /ec-starter.tf /etc/config/main.tf
else
        echo "Enter the encoded url"
        read url
        #curl $( echo $url | base64 -d ) | jq -r '.file' >> /etc/config/main.tf
	mv /starter.tf /etc/config/main.tf
fi

cd /etc/config
terraform init
terraform plan
