#!/bin/bash

wget -O "puppet8-release-jammy.deb" "https://apt.puppet.com/puppet8-release-jammy.deb"
dpkg -i puppet8-release-jammy.deb
apt-get update -y
apt-get install -y puppet-agent