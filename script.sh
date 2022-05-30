#!/bin/bash
apt update && apt install -y unzip jq net-tools
cd /tmp
wget https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_windows_amd64.zip
unzip terraform_1.2.1_windows_amd64.zip
rm terraform_1.2.1_windows_amd64.zip
mv terraform_1.2.1_windows_amd64 /usr/local/bin
cd /
terraform version