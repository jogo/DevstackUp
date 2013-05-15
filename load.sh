#!/bin/sh
sudo apt-get install -qqy git
git clone -b stable/grizzly https://github.com/openstack-dev/devstack.git ;
cd devstack;
sudo cp /vagrant/localrc .
./stack.sh
