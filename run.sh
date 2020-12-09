#!/usr/bin/env bash

source venv/bin/activate
robot --variable BROWSER:Firefox --outputdir results --report report-firefox.html --log log-firefox.log.html --output output-firefox.xml  --noncritical bugs notedo.robot
# open results/report-firefox.html

# robot --variable BROWSER:Chrome --outputdir results --report report-chrome.html --log log-chrome.log.html --output output-chrome.xml  --noncritical bugs notedo.robot
# open results/report-chrome.html

