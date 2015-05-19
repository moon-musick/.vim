#!/bin/bash

BASEDIR="$(dirname ${BASH_SOURCE[0]})"

cd "${BASEDIR}"
git submodule update --init --recursive
# gem install rcodetools
cd "${BASEDIR}/bundle/YouCompleteMe"
./install.sh
cd "${BASEDIR}/bundle/ctrlp-cmatcher"
./install.sh

# custom colorscheme for airline
cp "${BASEDIR}/moonmusick.vim" \
  "${BASEDIR}/bundle/vim-airline/autoload/airline/themes/"

touch "${BASEDIR}/install.lock"
