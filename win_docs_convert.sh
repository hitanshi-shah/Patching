#!/bin/bash

declare -A prefixes=(
  ["passed_windowsup"]="winupdate_precheck_passed1"
  ["passed_LS"]="LS_precheck_passed"
  ["passed_fw"]="fw_precheck_passed"
  ["passed_bi"]="bi_precheck_passed"
  ["passed_am"]="am_precheck_passed"
  ["passed_patch"]="patch_win_passed"
)

# Loop through each prefix and corresponding output file
for prefix in "${!prefixes[@]}"; do
  output_file="${prefixes[$prefix]}"
  > "$output_file"  # Initialize the output file

  for file in "${prefix}_"*; do
    # Check if the current file exists
    if [ -e "$file" ]; then
      dos2unix "$file"
      echo "Concatenating $file to $output_file..."
      cat "$file" >> "$output_file"
      rm "$file"
    fi
  done
done

