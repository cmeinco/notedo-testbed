python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
webdrivermanager firefox chrome --linkpath ${VIRTUAL_ENV}/bin
# deactivate
