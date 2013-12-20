#!/bin/bash
#File - mm.sh
#Author - Freyr Lin
#Email - linfan.china@gmail.com
#Version - v1.0
#Last modified - 2013/12/20
# Create main.cc file, use vim open it, then try build and run it

function usage
{
    echo "mm.sh [-m] [-g] [-f <FLAGS>] [-c <COMPILER>] [<FILE>]"
}

FLAGS=""
COMPILER="g++"
USE_MAKEFILE=0
USE_DEBUG=0
while getopts ":mgf:c:" opt
do
    case ${opt} in
        f ) FLAGS="${OPTARG}"
        ;;
        c ) COMPILER="${OPTARG}"
        ;;
        m ) USE_MAKEFILE=1
        ;;
        g ) USE_DEBUG=1
        ;;
        ? ) usage
        exit 1
        ;;
    esac
done
shift $(($OPTIND - 1))

FILE="main.cc"
if [ -n "${1}" ]; then
    FILE=${1}
fi
BINARY=${FILE%%.*}
shift

# Edit
vim ${FILE}

# Compile
rm -f ${BINARY}
if [ ${USE_MAKEFILE} -eq 1 ]; then
    make
else
    COMMAND="${COMPILER} -o ${BINARY} ${FLAGS} ${FILE}"
    if [ ${USE_DEBUG} -eq 1 ]; then
        COMMAND="${COMMAND} -g"
    fi
    echo "${COMMAND}"
    ${COMMAND}
fi

# Run
if [ ${?} -eq 0 ]; then
    ./${BINARY} ${*}
fi
