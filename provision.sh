#!/bin/bash

## Vagrant provision shell script


TERRAFORM_VERSION="0.12.5"
PACKER_VERSION="1.4.2"
GOLANG_VERSION="1.12.7"
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
sudo mv terraform /usr/local/bin

# Packer installation
wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
unzip packer_${PACKER_VERSION}_linux_amd64.zip
chmod +x packer
sudo mv packer /usr/local/bin

# Golang installation
wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz
mkdir $HOME/go
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc


# Environment variables
# source /home/vagrant/provision.env

rm -rvf $WORKDIR
