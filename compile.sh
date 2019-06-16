#!/usr/bin/env bash

#--------------------------------------------------#
# This script compiles some extensions for PHP 7+. #
#                                                  #
# Author: Jack Cherng <jfcherng@gmail.com>         #
#--------------------------------------------------#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THREAD_CNT=$(getconf _NPROCESSORS_ONLN)

LESS_FILES=(
    "styles/embed.less"
    "styles/my-elastic.less"
    "styles/print.less"
    "styles/styles.less"
)

JS_FILES=(
    "ui.js"
)


#-------#
# begin #
#-------#

pushd "${SCRIPT_DIR}" || exit


#--------------------#
# compile LESS files #
#--------------------#

for LESS_FILE in "${LESS_FILES[@]}"; do
    echo "==================================="
    echo "Begin compile '${LESS_FILE}'..."
    echo "==================================="

    file_compiled=${LESS_FILE%.*}.css

    lessc "${LESS_FILE}" > "${file_compiled}"
done

for JS_FILE in "${JS_FILES[@]}"; do
    echo "==================================="
    echo "Begin minify '${JS_FILE}'..."
    echo "==================================="

    file_compiled=${JS_FILE%.*}.min.js

    babel "${JS_FILE}" -o "${file_compiled}"
done


#-----#
# end #
#-----#

popd || exit
