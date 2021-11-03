#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# configure hashicorp apt repo
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# install terraform
# we will use version 0.11.15 as its the version used in the tutorial
apt-get update -y
apt-get install -y terraform=0.11.15
