#!/usr/bin/env bash

#--------------------------------------------------#
# This script compiles asset files.                #
#                                                  #
# Author: Jack Cherng <jfcherng@gmail.com>         #
#--------------------------------------------------#

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
THREAD_CNT=$(getconf _NPROCESSORS_ONLN)
PROJECT_ROOT=${SCRIPT_DIR}

LESS_FILES=(
    "styles/embed.less"
    "styles/my-elastic.less"
    "styles/print.less"
    "styles/styles.less"
)

JS_FILES=(
    "ui.js"
)

PATH=${PROJECT_ROOT}/node_modules/.bin:${PATH}


#-------#
# begin #
#-------#

pushd "${SCRIPT_DIR}" || exit


#--------------------#
# compile LESS files #
#--------------------#

for file_src in "${LESS_FILES[@]}"; do
    echo "==================================="
    echo "Begin compile '${file_src}'..."
    echo "==================================="

    file_dst=${file_src%.*}.css

    lessc "${file_src}" > "${file_dst}"
done


#----------------------------#
# transpile Javascript files #
#----------------------------#

for file_src in "${JS_FILES[@]}"; do
    echo "==================================="
    echo "Begin transpile '${file_src}'..."
    echo "==================================="

    file_dst=${file_src%.*}.min.js

    babel "${file_src}" -o "${file_dst}"
done


#-----#
# end #
#-----#

popd || exit
