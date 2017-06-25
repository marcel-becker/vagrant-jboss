#!/bin/bash

set -e
set -x

scp -i ~/.ssh/amazon_aws1.pem activemq-1.xml ubuntu@54.219.167.48:/home/ubuntu/jboss-fuse/etc/activemq.xml
scp -i ~/.ssh/amazon_aws1.pem activemq-2.xml ubuntu@54.183.243.113:/home/ubuntu/jboss-fuse/etc/activemq.xml
scp -i ~/.ssh/amazon_aws1.pem activemq-3.xml ubuntu@54.193.71.18:/home/ubuntu/jboss-fuse/etc/activemq.xml
scp -i ~/.ssh/amazon_aws1.pem activemq-4.xml ubuntu@54.183.27.174:/home/ubuntu/jboss-fuse/etc/activemq.xml
