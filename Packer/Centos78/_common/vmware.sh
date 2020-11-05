#!/bin/sh -eux

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
    yum -y install net-tools
    yum -y install epel-release
    yum -y install open-vm-tools
fi
