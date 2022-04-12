#!/bin/bash

cd $(dirname $0)

sudo apt-get install -y ansible

ansible-playbook --connection=local -i localhost, playbook/playbook.yml