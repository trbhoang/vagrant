#!/bin/bash

mkdir .ssh
cp -vf ~/.ssh/* .ssh
vagrant ssh -c "cp -rvf /vagrant/.ssh .; rm -rvf /vagrant/.ssh"
