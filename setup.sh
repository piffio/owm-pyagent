#!/bin/bash

TOPDIR=$(BASEDIR=`dirname $0` && cd $BASEDIR && pwd)
ENVDIR=${TOPDIR}/env
ACTIVATE=${ENVDIR}/bin/activate

if [ ! -z "${VIRTUAL_ENV}" ]; then
  echo -ne "You're in a virtual env.\nPlease run 'deactivate' first\n"
  exit 1
fi

[ -d "${ENVDIR}" ] && rm -rf ${ENVDIR}

pyvenv-3.3 "${ENVDIR}"

. ${ENVDIR}/bin/activate

mkdir -p ${ENVDIR}/tmp && cd ${ENVDIR}/tmp

wget https://bitbucket.org/pypa/setuptools/downloads/ez_setup.py
python ez_setup.py
easy_install pip
pip install selenium
pip install pytest

deactivate

echo "Environment ready, run 'source ${ACTIVATE} from your shell to activate it"
