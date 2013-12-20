#!/bin/bash
#File - who-use-port.sh
#Author - Freyr Lin
#Email - linfan.china@gmail.com
#Version - v1.0
#Last modified - 2013/12/20
# Show which process using the specified port

function usage()
{
    cat << EOUSAGE
Usage: who-use-port [-t|-u|-a] [port]
EOUSAGE
}
                                                                                                                                                                                              
PFLAG="tu"
case ${1} in
    -t )
    PFLAG="t"
    shift
    ;;
    -u )
    PFLAG="u"
    shift
    ;;
    -a )
    PFLAG=""
    shift
    ;;
    -h )
    usage
    exit 0
    ;;
esac
if [ "${1}" == "" ]; then
    netstat -${PFLAG}pna 2>/dev/null
else
    netstat -${PFLAG}pna 2>/dev/null | sed -n 2'p'
    netstat -${PFLAG}pna 2>/dev/null | grep :${1}
fi
