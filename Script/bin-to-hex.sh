#!/bin/bash
# Take binary input and run it through bc for hex output
option='ibase=2;obase=16;'
convert=${option}$@
echo $convert | bc
