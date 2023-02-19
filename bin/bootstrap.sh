#!/bin/sh

# Xcode CLI tool
xcode-select --install

# Intel Emulator For Intel Silicon processors
# IGNORE
# Package Authoring Error: 012-60306: Package reference com.apple.pkg.RosettaUpdateAuto is missing installKBytes attribute 
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Install PIP 
rm get-pip.py
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# Install Ansible
sudo pip3 install --ignore-installed ansible

# Install packages
ansible-galaxy install -r requirements.yml
ansible-playbook -i "localhost," -v -c local ansible_osx.yml --ask-become-pass
