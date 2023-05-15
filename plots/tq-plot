#!/bin/bash

# Set the file name and path for the output plot
output_file="plot.png"

# Create a temporary gnuplot script
gnuplot_script=$(mktemp)

# Generate the gnuplot script
cat > "$gnuplot_script" <<EOL
set terminal png      # Set the terminal type to PNG
set output '$output_file' # Specify the output file name
set xrange [0.1:1.9]   # Set the range for x values (excluding 2)
set yrange [-10:10]    # Set the range for y values
plot x/2/(2-x) with lines    # Plot y = x/2/(2-x) as a line
EOL

# Execute the gnuplot script
gnuplot "$gnuplot_script"

# Remove the temporary gnuplot script
rm "$gnuplot_script"

echo "Plot saved as $output_file"
