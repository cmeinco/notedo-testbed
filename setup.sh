#!/usr/bin/env bash

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
webdrivermanager firefox chrome --linkpath ${VIRTUAL_ENV}/bin
# deactivate

# should be a one time thing, then just run notedo upgrade? or maybe download olderone then do upgrade.
gh repo clone elnook/notedo
latest=`gh release list | awk '{ print $1 }' | head -1`
gh release download ${latest}
tar xvzf notedo-linux-*

./notedo version


# kill prev version and restart:
./notedo server --datadir data -p 8081 --daemon



exit 0

# install firefox

# install chrome

# install gh cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh
