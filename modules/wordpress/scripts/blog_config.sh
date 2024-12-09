#!/bin/bash

wp core install \
    --url=www.myfirstblog.com \
    --title='First Blog made with Puppet and Vagrant!' \
    --admin_user=devops \
    --admin_password=pass \
    --admin_email=devopssupport@gmail.com