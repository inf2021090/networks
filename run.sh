#!/bin/bash

# Compile the C++ code
gcc-lm mm1.c -o mm1

# Create a file to store the results
echo "# arrival_rate num_delays_required execution_time" > results.txt

# Define initial values
arrival_rate=1.0
service_rate=0.5
num_delays_required=1000

# Run the program 20 times and store the execution times
for i in {1..20}; do
  echo "Running iteration $i..."
  execution_time=$(./mm1 | awk '/^Time simulation ended/ { print $NF }')
  echo "$arrival_rate $num_delays_required $execution_time" >> results.txt

  # Increment the values
  arrival_rate=$(awk -v rate="$arrival_rate" 'BEGIN { printf "%.1f", rate + 1.0 }')
  num_delays_required=$((num_delays_required + 500))
done

# Create a gnuplot script to plot the results
echo "set terminal png
set output 'plot.png'
set title 'Execution Times'
set xlabel 'arrival_rate'
set ylabel 'num_delays_required'
plot 'results.txt' using 1:2:3 with points palette pointtype 7 pointsize 1.5" > plot.gp

# Use gnuplot to create the plot
gnuplot plot.gp

