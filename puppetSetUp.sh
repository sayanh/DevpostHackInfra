#!/bin/bash

sudo apt-get update
sudo apt-get install -y python-software-properties
cd /tmp && wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb && sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update 
sudo apt-get install -y puppet-common
sudo apt-get install -y puppet

puppet module install garethr/docker
puppet module install saz-sudo
puppet module install puppetlabs/vcsrepo

sudo puppet apply --modulepath=/root/DevVM/modules:/etc/puppet/modules /root/DevVM/manifests/site.pp
#sudo puppet apply --modulepath=/vagrant/modules:/home/vagrant/.puppet/modules /vagrant/manifests/site.pp

cd ~
# sudo gpasswd -a ${USER} docker
# sudo service docker restart
# alias docker='sudo docker'


