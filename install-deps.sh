#!/usr/bin/env bash

#--------------------------------------------------#
# This script compiles some extensions for PHP 7+. #
#                                                  #
# Author: Jack Cherng <jfcherng@gmail.com>         #
#--------------------------------------------------#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THREAD_CNT=$(getconf _NPROCESSORS_ONLN)


#-------#
# begin #
#-------#

pushd "${SCRIPT_DIR}" || exit

yarn add \
    @babel/core \
    @babel/plugin-transform-runtime \
    @babel/preset-env \
    babel-cli \
    babel-preset-minify \
    core-js@3 \
    less


#-----#
# end #
#-----#

popd || exit
