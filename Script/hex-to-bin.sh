#!/bin/bash
# Take hex input and run it through bc for binary output
INPUT_NUM=`echo $@ | sed 's/[a-z]/\U&/g'`
option='ibase=16;obase=2;'
convert=${option}$INPUT_NUM
echo $convert | bc
