#!/usr/bin/env bash

source venv/bin/activate
robot --variable BROWSER:headlesschrome --outputdir . --report report.html --log log.html --output output.xml  --noncritical bugs notedo.robot
# open results/report-firefox.html

# robot --variable BROWSER:Chrome --outputdir results --report report-chrome.html --log log-chrome.log.html --output output-chrome.xml  --noncritical bugs notedo.robot
# open results/report-chrome.html

