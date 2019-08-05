#!/bin/bash

## Vagrant provision shell script


TERRAFORM_VERSION="0.12.5"
PACKER_VERSION="1.4.2"
WORKDIR=/tmp/provision

mkdir -p $WORKDIR
cd $WORKDIR


# Ansible installation
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update --yes
sudo apt-get install ansible --yes

# Terraform installation
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
chmod +x terraform
mv terraform /usr/local/bin

# Packer installation
wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
unzip packer_${PACKER_VERSION}_linux_amd64.zip
chmod +x packer
mv packer /usr/local/bin

# Environment variables
# source /home/vagrant/provision.env

rm -rvf $WORKDIR
