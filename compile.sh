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


#-----#
# end #
#-----#

popd || exit
