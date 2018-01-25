#!/bin/bash

set -exo pipefail

if [[ ! -x /usr/local/bin/brew ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ ! -x /usr/local/bin/ansible ]]; then
  brew install ansible
fi

ansible-playbook -vvvv `pwd`/`dirname $0`/ansible/devstation.yml -i "127.0.0.1,"
