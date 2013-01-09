#!/bin/bash

vagrant up
vagrant package
vagrant box add devstack package.box -f
vagrant destroy -f
