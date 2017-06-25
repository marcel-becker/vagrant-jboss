# Vagrant AMQ

## Vagrant File to Run 4 AMQ servers as 4 distinct VMs.

Use this vagrant file to run 4 AMQ servers in the same host.

## Usage:

1. cd to the directory where the Vagrantfile is located.
```bash
$ cd vagrant-jboss
```
2. open 4 different shells or terminals on this same folder.
3. start a vm in each terminal using one of:
```bash
$ vagrant up node-1 --provision # in terminal 1
$ vagrant up node-2 --provision # in terminal 2
$ vagrant up node-3 --provision # in terminal 3
$ vagrant up node-4 --provision # in terminal 4
```

4. Use the following commands to re-start or re-provision the machine on each node:
```bash
$ vagrant reload --provision node-1
$ vagrant ssh node-1 # log into the machine.
$ vagrant halt node-1 # stop node 1
$ vagrant halt # stop all nodes
$ vagrant destroy node-1 # destroy node 1
$ vagrant destroy # destroy, remove all nodes.
```

The VMs are configured to use the same IP addresses used by the AMQ servers in Northrup Grummann devcloud:
* *10.22.54.7* is node-1
* *10.22.54.8* is node-2
* *10.22.54.9* is node-3
* *10.22.54.17* is node-4

## Apache AMQ or JBoss Fuse

The vagrant script will install both Apache AMQ 5.14.5 and Jboss Fuse 6.2.1 on the VMs.

When vagrants starts or provision the VMs, it will automatically start either Apache AMQ or Jboss Fuse.

Comment or uncomment the line in the Vagrantfile that starts JBoss Fuse or Apache AMQ:
```ruby
# This line starts the JBOSS Fuse
node.vm.provision :shell, path: "start-fuse.sh", run: 'always'

This line starts the Apache AMQ
# node.vm.provision :shell, inline: "/opt/amq/amq/bin/activemq console", run: 'always'
```

## Running and Configuring Apache AMQ

The provisioning process will place the Apache AMQ distribution under
```bash
/opt/amq/amq
```

It will also copy the appropriate config file
(*activemq-apache-1.xml, activemq-apache-2.xml, activemq-apache-3.xml, activemq-apache-4.xml*) to the
*/opt/amq/amq/conf* folder.

To configure and start/stop AMQ manually, edit the appropriate xml config file, ssh into the node vm, stop the AMQ if it
is running, copy the config to the *conf* folder, and re-start the AMQ on the node:
```bash
$ vagrant ssh node-1
$ /opt/amq/amq/bin activemq stop
$ cp /vagrant/activemq-apache-1.xml /opt/amq/amq/conf/activemq.xml
$ /opt/amq/amq/bin/activemq console
```


## Running and Configuring JBoss Fuse

The provisioning process will place the JBoss Fuse distribution under
```bash
/opt/jboss/jboss-fuse
```

It will also copy the appropriate config file
(*activemq-1.xml, activemq-2.xml, activemq-3.xml, activemq-4.xml*) to the
*/opt/jboss/jboss-fuse/etc* folder.

To configure and start/stop jboss fuse  manually, edit the appropriate xml config file, ssh into the node vm, stop the AMQ if it
is running, copy the config to the *etc* folder, and re-start fuse on the node:
```bash
$ vagrant ssh node-1
$ sudo -s # run as root
$ /opt/jboss/jboss-fuse/bin/admin list
$ kill -9 <pid of running jboss>
$ cp /vagrant/activemq-1.xml /opt/jboss/jboss-fuse/etc/activemq.xml
$ /opt/jboss/jboss-fuse/bin/fuse server
```
