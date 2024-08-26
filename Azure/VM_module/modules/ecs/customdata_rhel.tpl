#! /bin/bash

sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf -y install ansible
sudo tuned-adm profile balanced
