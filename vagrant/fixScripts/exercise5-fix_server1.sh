#!/bin/bash
#add fix to exercise5-server1 here
sudo -- sh -c -e "ssh-keyscan 192.168.100.11 >> /home/vagrant/.ssh/known_hosts"
sudo -- sh -c -e "ssh-keyscan 192.168.100.11 >> /root/.ssh/known_hosts"

sshpass_exist=`command -v sshpass`
if [ -z $sshpass_exist ]
then
        sudo apt-get install sshpass
fi

if [ ! -f /home/vagrant/.ssh/id_rsa ]
then
       ssh-keygen -q -N "" -f /home/vagrant/.ssh/id_rsa
fi
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa*

sshpass -p 'vagrant' ssh-copy-id -i .ssh/id_rsa.pub vagrant@192.168.100.11
sshpass -p 'vagrant' ssh-copy-id -i .ssh/id_rsa.pub root@192.168.100.11
