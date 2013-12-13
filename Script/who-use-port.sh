#!/bin/bash
# Usage: who-use-port [-t|-u|-a] [port]
                                                                                                                                                                                              
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
esac
if [ "${1}" == "" ]; then
    netstat -${PFLAG}pna 2>/dev/null
else
    netstat -${PFLAG}pna 2>/dev/null | sed -n 2'p'
    netstat -${PFLAG}pna 2>/dev/null | grep :${1}
fi
