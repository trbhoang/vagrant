# Vagrant

## Resolve shared folder not auto-updated on Virtual Box

`vagrant plugin install vagrant-vbguest`

`vagrant up`

! Set synced folder type to 'virtualbox'

## Move host ssh configs to vagrant box

`cp -vf ~/.ssh $shared_folder`
`vagrant ssh`
`cp -vf $shared_folder/.ssh .ssh`
