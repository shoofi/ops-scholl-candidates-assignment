#!/bin/bash
#add fix to exercise5-server1 here
server2_ssh_public_key=`ssh-keyscan 192.168.100.11`
echo $server2_ssh_public_key >> /home/vagrant/.ssh/known_hosts

sshpass_exist=`command -v sshpass`
if [ -z $sshpass_exist ]
then
        sudo apt-get install sshpass
fi

if [ ! -f /home/vagrant/.ssh/id_rsa ]
then
       ssh-keygen -q -N "" -f /home/vagrant/.ssh/id_rsa
fi
sshpass -p 'vagrant' ssh-copy-id vagrant@192.168.100.11
