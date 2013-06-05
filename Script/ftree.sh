#!/bin/bash
# To show files in a folder/file list recursively

if [[ ${#} -eq 2 && "${1}" = "-i" ]]; then
    for LINE in `cat ${2}`; do
        tree -fil ${LINE} | sed -e '/^$/d' -e '/^[0-9]* directories, [0-9]* files$/d' -e 's/\([^\[]*\) \[error opening dir\]$/\1/g'
    done
elif [[ "${1}" != "" && "${1}" != "-h" ]]; then
    for ITEM in ${@}; do
        tree -fil ${ITEM} | sed -e '/^$/d' -e '/^[0-9]* directories, [0-9]* files$/d' -e 's/\([^\[]*\) \[error opening dir\]$/\1/g'
    done
else
    echo "Usage: ftree.sh <folder1> <folder2> ..."
    echo "       ftree.sh -i <folder-list-file>"
fi
