#!/usr/bin/env bash

set -x

firefox --headless --screenshot --window-size=1024,768 --profile ./profile http://localhost:8081 

source venv/bin/activate
robot --variable BROWSER:headlessfirefox --outputdir results --report report.html --log log.html --output output.xml  --noncritical bugs notedo.robot
# open results/report-firefox.html

# robot --variable BROWSER:Chrome --outputdir results --report report-chrome.html --log log-chrome.log.html --output output-chrome.xml  --noncritical bugs notedo.robot
# open results/report-chrome.html

# firefox --headless --window-size=800,600 --profile ./profile --screenshot http://localhost:8081
