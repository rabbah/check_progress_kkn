#!/bin/bash

set -e

# do this for local development, but for packaging the function, skip pip in the venv
if [ -n "${LOCAL_DEV}" ]; then
  virtualenv virtualenv
  source virtualenv/bin/activate
  pip install -r requirements.txt
  deactivate
else
  virtualenv --without-pip virtualenv
  pip install -r requirements.txt --target virtualenv/lib/python3.9/site-packages
fi
