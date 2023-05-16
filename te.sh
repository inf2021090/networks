#!/bin/bash

x=0.1
for ((i=0; i<19; i++))
do
  w=$(bc -l <<< "scale=2; 1/$x")  # Calculates 1/x using 'bc' command
  sed -i "0,/^[0-9]\+\.[0-9]\+/s//[0-9]\.$(printf "%02d" $w)/" mm1.in  # Replaces the first numeric value with the calculated result
  x=$(bc -l <<< "$x+0.1")  # Increment x by 0.1
done
