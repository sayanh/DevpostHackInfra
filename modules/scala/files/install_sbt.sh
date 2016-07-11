#!/bin/bash

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt
wget http://downloads.lightbend.com/scala/2.11.6/scala-2.11.6.tgz -P /home/vagrant/
