#!/bin/bash
#
# Installs most prerequisites for testing, without running the final "ansible-playbook" command.
#
# Instructions:
#
# curl -sL https://raw.githubusercontent.com/sdarwin/Ansible-VNC/master/scripts/qa.sh | sudo bash
#
#

set -x
set -e
PATH=/usr/local/bin:$PATH

if [[ -f /usr/bin/apt-get ]]
then
    sudo apt-get update
fi

if ! which git
then
  if [[ -f /usr/bin/apt-get ]]
  then
    sudo apt-get install -y git
  fi
  if [[ -f /bin/yum ]]
  then
    sudo yum install -y git
  fi
fi

if ! which ansible 
then
  if [[ -f /usr/bin/apt-get ]]
  then
    sudo apt-get install -y python3-pip
    sudo pip3 install ansible
  fi
  if [[ -f /bin/yum ]]
  then
    sudo yum install -y epel-release
    sudo yum install -y python3-pip
    sudo pip3 install ansible
  fi
fi

sudo mkdir -p /etc/ansible/roles
cd /etc/ansible/roles
sudo git clone https://github.com/sdarwin/Ansible-VNC sdarwin.VNC

