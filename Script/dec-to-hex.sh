#!/bin/bash
# Take decimal input and run it through bc for hex output
option='obase=16;'
convert=${option}$@
echo $convert | bc
