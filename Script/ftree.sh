#!/bin/bash
#File - ftree.sh
#Author - Freyr Lin
#Email - linfan.china@gmail.com
#Version - v1.0
#Last modified - 2013/12/20
# To show files in a folder/file list recursively

function usage()
{
    cat << EOUSAGE
Usage: ftree.sh <folder1> <folder2> ...
       ftree.sh -i <folder-list-file>
EOUSAGE
}

if [[ ${#} -eq 2 && "${1}" = "-i" ]]; then
    for LINE in `cat ${2}`; do
        tree -fil ${LINE} | sed -e '/^$/d' -e '/^[0-9]* directories, [0-9]* files$/d' -e 's/\([^\[]*\) \[error opening dir\]$/\1/g'
    done
elif [[ "${1}" != "" && "${1}" != "-h" ]]; then
    for ITEM in ${@}; do
        tree -fil ${ITEM} | sed -e '/^$/d' -e '/^[0-9]* directories, [0-9]* files$/d' -e 's/\([^\[]*\) \[error opening dir\]$/\1/g'
    done
else
    usage
fi
