#!/usr/bin/env bash
firefox --headless http://localhost:8081 --screenshot 

source venv/bin/activate
robot --variable BROWSER:headlessfirefox --outputdir results --report report.html --log log.html --output output.xml  --noncritical bugs notedo.robot
# open results/report-firefox.html

# robot --variable BROWSER:Chrome --outputdir results --report report-chrome.html --log log-chrome.log.html --output output-chrome.xml  --noncritical bugs notedo.robot
# open results/report-chrome.html

