#!/bin/bash

FILES_DIR="./files"

if [ ! -d "$FILES_DIR" ]; then
  echo "Error: '$FILES_DIR' directory not found."
  exit 1
fi

for file_path in "$FILES_DIR"/*; do
  if [ -f "$file_path" ]; then
    file_name=$(basename "$file_path")
    first_char=$(echo "${file_name:0:1}" | tr '[:upper:]' '[:lower:]')
    if [[ "$first_char" =~ [a-z] ]]; then
      mv "$file_path" "./$first_char/"
    fi
  fi
done

echo "✅ All files arranged by their first letter."
