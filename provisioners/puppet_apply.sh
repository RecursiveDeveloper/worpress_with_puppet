#!/bin/bash

puppet_exec=$1
manifest_path=$2

sudo ${puppet_exec} apply ${manifest_path}