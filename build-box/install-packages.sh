#!/bin/bash +x

apt-get install -qqy git
git clone https://github.com/openstack-dev/devstack.git;
cd devstack;

TOP_DIR=$(cd $(dirname "$0") && pwd)
source $TOP_DIR/stackrc
source $TOP_DIR/functions

install_package $(get_packages $TOP_DIR/files/apts)
install_package rabbitmq-server
install_package libvirt-bin

cd ../
rm -rf devstack
