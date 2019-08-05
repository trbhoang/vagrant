#!/bin/bash

# sync host's ssh config with guest's

mkdir .ssh
cp -vf ~/.ssh/* .ssh
vagrant ssh -c "cp -rvf /vagrant/.ssh .; rm -rvf /vagrant/.ssh"
