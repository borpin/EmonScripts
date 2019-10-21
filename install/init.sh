#!/bin/bash

user=$USER
openenergymonitor_dir=/opt/openenergymonitor
emoncms_dir=/opt/emoncms

sudo apt-get update -y
sudo apt-get install -y git-core

sudo mkdir $openenergymonitor_dir
sudo chown $user $openenergymonitor_dir

sudo mkdir $emoncms_dir
sudo chown $user $emoncms_dir

cd $openenergymonitor_dir

git clone https://github.com/openenergymonitor/EmonScripts.git
cd $openenergymonitor_dir/EmonScripts
if [ "$1" != "" ]; then
    git checkout $1
else
    git checkout stable
fi

cd $openenergymonitor_dir/EmonScripts/install
./main.sh $1
cd

rm init.sh
