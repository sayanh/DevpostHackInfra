#!/bin/bash

sudo su vagrant
chown vagrant:vagrant -R spark
mkdir -p /home/vagrant/spark
chown vagrant:vagrant -R /home/vagrant/spark 
cd /home/vagrant/spark
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2.tgz 
tar -zxvf spark-1.6.2.tgz
cd spark-1.6.2/
sbt/sbt package
chmod 777 -R * 
chown vagrant:vagrant *
cd spark