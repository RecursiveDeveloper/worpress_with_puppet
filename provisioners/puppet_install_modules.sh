#!/bin/bash

puppet_exec=$1

sudo ${puppet_exec} module install puppetlabs-stdlib --version 6.6.0
sudo ${puppet_exec} module install puppet-archive --version 4.6.0
sudo ${puppet_exec} module install puppetlabs-apache --version 12.2.0
sudo ${puppet_exec} module install puppetlabs-mysql --version 14.0.0