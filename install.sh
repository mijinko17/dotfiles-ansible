#!/bin/bash

cd $(dirname $0)

sudo apt-get install -y ansible

./scripts/runPlaybook.sh