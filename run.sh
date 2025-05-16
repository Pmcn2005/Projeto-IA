#!/bin/bash

# Loop through all test input files
for input_file in ./tests/*.txt; do
    echo "Running test with input file: $input_file"

    # Define the expected output file (replace .txt with .out)
    expected_output_file="${input_file%.txt}.out"
    
    echo "Expected output file: $expected_output_file"
    # Run the Python script and capture the output
    python3 src/nuruomino.py < "$input_file" > output.txt

    # Compare the output with the expected output
    if diff -q output.txt "$expected_output_file" > /dev/null; then
        echo "$test_number: PASS"
    else
        echo "$test_number: FAIL"
        #echo "Differences:"
        #diff output.txt "$expected_output_file"
    fi
done

# Clean up temporary output file
rm -f output.txt