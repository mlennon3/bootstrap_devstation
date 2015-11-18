#!/bin/bash

set -e

if [[ ! -x /usr/local/bin/brew ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ ! -x /usr/local/bin/ansible ]]; then
  brew install ansible
fi

ansible-playbook -vvvv `pwd`/`dirname $0`/ansible/devstation.yml --ask-sudo-pass -i "127.0.0.1,"
