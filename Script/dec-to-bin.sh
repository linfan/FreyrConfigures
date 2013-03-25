#!/bin/bash
# Take decimal input and run it through bc for binary output
option='ibase=10;obase=2;'
convert=${option}$@
echo $convert | bc
