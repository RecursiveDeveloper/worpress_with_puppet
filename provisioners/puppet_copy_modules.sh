#!/bin/bash

own_modules_path=$1
forge_modules_path=$2

sudo cp -r "${own_modules_path}/mysql_wp" "${forge_modules_path}"
sudo cp -r "${own_modules_path}/apache_wp" "${forge_modules_path}"
sudo cp -r "${own_modules_path}/wordpress" "${forge_modules_path}"