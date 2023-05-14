#!/bin/bash

# Compile the C++ code
g++ mm1.cpp -o mm1

# Create a file to store the results
echo "# execution time" > results.txt

# Run the program 20 times and store the execution times
for i in {1..20}; do
  echo "Running iteration $i..."
  time=$(./mm1)
  echo "$time" >> results.txt
done

# Create a gnuplot script to plot the results
echo "set terminal png
set output 'plot.png'
set title 'Execution Times'
set xlabel 'Iteration'
set ylabel 'Time (s)'
plot 'results.txt' with linespoints" > plot.gp

# Use gnuplot to create the plot
gnuplot plot.gp
