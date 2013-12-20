#!/bin/bash
#File - fgrep.sh
#Author - Freyr Lin
#Email - linfan.china@gmail.com
#Version - v1.0
#Last modified - 2013/12/20
# Recursively search file content

function usage()
{
    cat << EOUSAGE
USAGE: fgrep.sh 'string_to_search' ['file_patternr']
EOUSAGE
}

OPTION=""
while getopts ":il" opt
do
    case ${opt} in
        i ) OPTION="-i ${OPTION}"
        ;;
        l ) OPTION="-l ${OPTION}"
        ;;
        ? ) usage
        exit 1
        ;;
    esac
done
shift $(($OPTIND - 1))

if [ "${1}" != "" ]; then
    if [ "${2}" == "" ]; then
        echo "## RUN: grep ${OPTION} -r -H -n --color=auto \"${1}\" *"
        grep ${OPTION} -r -H -n --color=auto "${1}" *
    else
        echo "## RUN: find -L . -name \"${2}\" | xargs -I {} grep ${OPTION} -H -n --color=auto \"${1}\" {}"
        find -L . -name "${2}" | xargs -I {} grep ${OPTION} -H -n --color=auto "${1}" {}
    fi
else
    echo $USAGE
fi

