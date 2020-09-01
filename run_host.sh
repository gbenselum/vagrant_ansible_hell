#!/bin/bash
# This script must run your host 
# After Run, start with: "vagrant ssh control"

#clean up ssh keys if is not the first run
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.56.106"

# send vagrant insecure KEY to control node
scp ~/.vagrant.d/insecure_private_key vagrant@192.168.56.106:~/.ssh/id_rsa
ssh vagrant@192.168.56.106 'chmod 700 ~/.ssh/id_rsa'

# send inventory to control node
curl https://raw.githubusercontent.com/gbenselum/diversity_ansible_lab/master/hosts --output ./inventory
scp ./inventory vagrant@192.168.56.106:~/inventory
rm inventory

# installs pip3 and then ansible on control node
ssh vagrant@192.168.56.106 'sudo yum install python3 -y; sudo pip3 install ansible ansible-lint'

# remmeber to press "yes" running your first ansible command
