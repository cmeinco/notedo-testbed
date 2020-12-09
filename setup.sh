#!/usr/bin/env bash

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
webdrivermanager firefox chrome --linkpath ${VIRTUAL_ENV}/bin
# deactivate

exit 0

# install firefox

# install chrome

# install gh cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh
