#!/bin/bash

# Define the two source files and the target file
file1="diskrempassed" 
file2="rhsa_precheckpass" 
target_file="common_rementries"  

if [ -e "$file1" ] && [ -e "$file2" ]; then
    sort "$file1" > sorted_file1.txt
    sort "$file2" > sorted_file2.txt
    comm -12 sorted_file1.txt sorted_file2.txt > "$target_file"
    
    # Clean up temporary sorted files
    rm sorted_file1.txt sorted_file2.txt
    
    echo "Common entries have been written to $target_file"
else
    echo "One or both source files do not exist."
fi
