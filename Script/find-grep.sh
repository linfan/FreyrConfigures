#!/bin/bash
#File - find-string-in-files.sh
#Author - Freyr Lin
#Email - fan.lin.ext@nsn.com
#Version - v1.0
#Last modified - 2012/12/14

USAGE='USAGE: find-string-in-files.sh "string_to_find" ["file_pattern"]'

if [ $# -eq 1 ]; then
    echo "## RUN: grep -r -H -n --color=auto \"${1}\" *"
    grep -r -H -n --color=auto "${1}" *
elif [ $# -eq 2 ]; then
    echo "## RUN: find -L . -name \"${2}\" | xargs -I {} grep -H -n --color=auto \"${1}\" {}"
    find -L . -name "${2}" | xargs -I {} grep -H -n --color=auto "${1}" {}
else
    echo $USAGE
fi
