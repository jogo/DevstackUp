#!/bin/bash
set -e
vagrant up
rm package.box
vagrant package
vagrant box add devstack package.box -f
vagrant destroy -f
