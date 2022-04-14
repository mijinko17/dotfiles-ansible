#!/bin/bash

cd $(dirname $0)

ansible-playbook --connection=local -i localhost, ../playbook/playbook.yml
