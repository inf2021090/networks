#!/bin/bash

# Define the path to the input file
input_file="mm1.in"

# Initialize the starting value
x=0.1

# Loop counter
count=1

# Execute the program 20 times
for (( i=1; i<=20; i++ ))
do
    # Read the first line of the input file and extract the first numeric value
    first_value=$(head -n 1 "$input_file" | awk '{print $1}')

    # Update the first numeric value with x/2
    new_value=$(bc <<< "scale=2; $x/2")

    # Replace the first numeric value with the new value in the input file
    sed -i "1s/$first_value/$new_value/" "$input_file"

    # Run your program and append the output to the results file
    ./your_program >> results

    # Append the separator line
    echo "#####" >> results

    # Increment the value of x by 0.1
    x=$(bc <<< "$x + 0.1")

    # Increment the loop counter
    count=$((count + 1))
done

echo "Execution completed."
