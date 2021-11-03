#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# install software
apt-get update -y
apt-get install -y ruby-full bundler

# todo kitchen
