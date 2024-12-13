#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required - <writefile> and <writestr>"
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Create the directory structure if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Try to create the file and write the string
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not create or write to file $writefile"
    exit 1
fi

echo "File created successfully: $writefile"
