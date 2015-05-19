#!/bin/bash

BASEDIR="$(dirname ${BASH_SOURCE[0]})"

cd "${BASEDIR}"
git submodule update --init --recursive
# gem install rcodetools
cd "${BASEDIR}/bundle/YouCompleteMe"
./install.sh
cd "${BASEDIR}/bundle/ctrlp-cmatcher"
./install.sh

touch "${BAASEDIR}/install.lock"
