#!/bin/bash


# Define the two source files and the target file
file1="precheckpassed_hosts" 
file2="precheckfailed_hosts" 
target_file="updated_precheckpass"  

if [ -e "$file1" ] && [ -e "$file2" ]; then
    sort "$file1" > sorted_file1.txt
    sort "$file2" > sorted_file2.txt
    comm -23 sorted_file1.txt sorted_file2.txt > "$target_file"
    
    echo "Common entries have been written to $target_file"
else
    echo "One or both source files do not exist."
fi
