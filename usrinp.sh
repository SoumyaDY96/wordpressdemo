#!/bin/bash

while [ -z "$domain_name" ];
do
  echo -e "Give us your domain name:\n"
  read domain_name
done
echo "localhost *.$domain_name" >> /etc/hosts
ping $domain_name -c 3