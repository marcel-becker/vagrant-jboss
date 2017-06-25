#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y


# Fuse environment setup
sudo apt-get purge openjdk*
sudo apt-get update
sudo apt-get -y install python-software-properties


sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

sudo apt-get install debconf-utils

echo debconf shared/accepted-oracle-license-v1-1 select true | \
sudo debconf-set-selections

echo debconf shared/accepted-oracle-license-v1-1 seen true | \
sudo debconf-set-selections

sudo apt-get install -y oracle-java8-installer
sudo apt-get -y install maven

# Hmmm... sometimes unzip is not installed in the ubuntu image
sudo apt-get install unzip

# Apache
sudo apt-get update
sudo apt-get install -y git
