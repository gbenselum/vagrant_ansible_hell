#!/bin/bash
# This script must run your host 
# After Run, start with: "vagrant ssh control"

# PREFLIGHT
#clean up ssh keys if is not the first run
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.56.106"

# send vagrant insecure KEY to control node
scp ~/.vagrant.d/insecure_private_key vagrant@192.168.56.106:~/.ssh/id_rsa
ssh vagrant@192.168.56.106 'chmod 700 ~/.ssh/id_rsa'

# installs git, pip3 and then ansible on control node
ssh vagrant@192.168.56.106 'sudo yum install python3 git -y; sudo pip3 install ansible ansible-lint'

# git clone on the control node
ssh vagrant@192.168.56.106 'git clone https://github.com/gbenselum/vagrant_ansible_hell.git'

# /etc/hosts file for DNS resolution
ssh vagrant@192.168.56.106 'sudo cp etchost /etc/hosts'

# create /etc/ansible
ssh vagrant@192.168.56.106 'sudo mkdir /etc/ansible'
echo ""remmeber to press "yes" for every host running your first ansible command ""

