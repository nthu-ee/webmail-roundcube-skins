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

JS_GLOBAL_VARS_FILE=${PROJECT_ROOT}/rc.globalVars.js

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

    file_export=${file_src%.*}.export.js
    file_dst=${file_src%.*}.min.js

    if [ ! -f "${file_export}" ]; then
        has_no_file_export=true
        touch "${file_export}"
    fi

    # to make the output file more diff-friendly, we beautify it and remove leading spaces
    cat "${JS_GLOBAL_VARS_FILE}" "${file_src}" "${file_export}" \
        | babel --filename "${file_src}" \
        | browserify - \
        | uglifyjs --compress --mangle --beautify indent_level=0 \
        > "${file_dst}"

    if [ "${has_no_file_export}" = "true" ]; then
        rm -f "${file_export}"
    fi
done


#-----#
# end #
#-----#

popd || exit