#!/usr/bin/env bash
### Check if a directory does not exist ###
if [ ! -d "venv" ] 
then
    python3 -m venv venv
    source venv/bin/activate

    pip install -r requirements.txt
    webdrivermanager firefox chrome --linkpath ${VIRTUAL_ENV}/bin
fi

if [ ! -d "profile" ] 
then
    mkdir profile
fi

if [ ! -d "results" ] 
then
    mkdir results
fi

if [ -z "$VIRTUAL_ENV" ] 
then
	source venv/bin/activate
fi

# deactivate

# should be a one time thing, then just run notedo upgrade? or maybe download olderone then do upgrade.
#gh repo clone elnook/notedo
#latest=`gh release list | awk '{ print $1 }' | head -1`
#gh release download ${latest}
#tar xvzf notedo-linux-*

# print prev version
./notedo version
# kill prev version and restart:
#notedopid=`ps -ef | grep notedo | awk '{print $2}' | head -1`
#kill ${notedopid}
#./notedo upgrade
#./notedo version
# ./notedo server --datadir data -p 8081 --daemon 


exit 0


# Jenkins Plugin
https://plugins.jenkins.io/robot/

# install firefox

# install chrome

# install gh cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh
