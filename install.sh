#!/bin/bash

BASEDIR="$(dirname ${BASH_SOURCE[0]})"

# gem install rcodetools

cd "${BASEDIR}/bundle/YouCompleteMe"
./install.sh

cd "${BASEDIR}/bundle/ctrlp-cmatcher"
./install.sh

touch "${BASEDIR}/install.lock"
