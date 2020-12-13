#!/usr/bin/env bash

# Defaults
debug=0
runlocal=0
browser=headlessfirefox

#browsers, headlessfirefox, firefox, chrome, headlesschrome, ??? from robotfwmwork

#todo; build pretty usage output
usage()
{
  echo "Usage: alphabet [ -a | --alpha ] [ -b | --beta ]
                        [ -c | --charlie CHARLIE ] 
                        [ -d | --delta   DELTA   ] filename(s)"
  exit 2
}

while getopts :dl o
do	case "$o" in
	d)	
        debug=1
        set -x
        ;;
	l)	
        runlocal=1
        ;;
    b)
        browser=$OPTARG
        ;;
	\?)	
        echo >&2 "Usage: $0 [-l] [-d]"
		exit 1
        ;;
	esac
done

rm -rf profile
mkdir profile

if [ "$debug" -eq "1" ]; then
   curl --verbose --url http://localhost:8081
   firefox --headless --screenshot --window-size=1024,768 --profile ./profile http://localhost:8081 
fi

if [ ! -d "venv" ]; then
  echo "VENV DOES NOT EXIST; PRE-SETUP FAILURE"
  exit 2
fi

source venv/bin/activate
robot --variable BROWSER:${browser} --outputdir results --report report.html --log log.html --output output.xml  --noncritical bugs notedo.robot

if [ "$runlocal" -eq "1" ]; then
   open results/report.html
fi
