#!/bin/bash
# Take binary input and run it through bc for decimal output
option='ibase=2;obase=10;'
convert=${option}$@
echo $convert | bc
