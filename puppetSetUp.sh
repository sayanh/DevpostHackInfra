#!/bin/bash

### Adding value to facter 
#export FACTERSERVER='nginx'

#facter server
server_name=$1
sed -i "s/s_name/${server_name}/" modules/custom_fact/lib/facter/cust_fact.rb
facter --puppet modules/custom_fact/lib/facter/cust_fact.rb

sudo apt-get update
sudo apt-get install -y python-software-properties
cd /tmp && wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb && sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update 
sudo apt-get install -y puppet-common
sudo apt-get install -y puppet

sudo puppet module install garethr/docker
sudo puppet module install saz-sudo
sudo puppet module install puppetlabs/vcsrepo

sudo puppet apply --modulepath=/vagrant/modules:/home/vagrant/.puppet/modules /vagrant/manifests/site.pp --debug --noop

cd ~
# sudo gpasswd -a ${USER} docker
# sudo service docker restart
# alias docker='sudo docker'


