#!/bin/bash

# Loop through all test input files
for input_file in ./tests/*.txt; do

    # Define the expected output file (replace .txt with .out)
    expected_output_file="${input_file%.txt}.out"

    
    # Run the Python script and capture the output
    time python3 src/nuruomino.py < "$input_file" > output.txt

    # Compare the output with the expected output
    if diff -q output.txt "$expected_output_file" > /dev/null; then
        echo "$input_file: PASS"
    else
        echo "$input_file: FAIL"
        echo "Differences:"
        diff output.txt "$expected_output_file"
    fi
done

# Clean up temporary output file
rm -f output.txt