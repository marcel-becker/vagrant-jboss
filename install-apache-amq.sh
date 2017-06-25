#!/bin/bash

set -e
set -x

if [ ! -d /opt/amq/amq ] ; then

    sudo rm -rf /opt/amq
    mkdir -p /opt/amq

    if [ -f /vagrant/apache-activemq-5.14.5-bin.tar.gz ] ; then
        cp /vagrant/apache-activemq-5.14.5-bin.tar.gz /opt/amq
    else
        cd /vagrant
        wget https://archive.apache.org/dist/activemq/5.14.5/apache-activemq-5.14.5-bin.tar.gz
        cp /vagrant/apache-activemq-5.14.5-bin.tar.gz /opt/amq
    fi

    cd /opt/amq

    tar -xvf apache-activemq-5.14.5-bin.tar.gz
    rm apache-activemq-5.14.5-bin.tar.gz
    mv apache-activemq-5.14.5 amq
fi
