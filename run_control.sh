#!/bin/bash
# This script must run in control node 
# from vagrant host, vagrant ssh control
scp ~/.vagrant.d/insecure_private_key vagrant@192.168.56.106:~/.ssh/id_rsa
curl https://raw.githubusercontent.com/gbenselum/diversity_ansible_lab/master/hosts --output ~/inventory
sudo yum install python3 -y
sudo pip3 install ansible ansible-lint

