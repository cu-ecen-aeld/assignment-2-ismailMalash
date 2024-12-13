#!/bin/bash

filesdir=$1
searchstr=$2

if [ $# -ne 2 ]
then
echo "MISSING ARGUMENTS!"
exit 1

elif [ ! -d $filesdir ]
then
echo "$filesdir does not represent a directory on the filesystem"
exit 1

fi

num_files=0
num_matching_lines=0

# Find all files in the directory and its subdirectories
while IFS= read -r file
 do
    # Count the number of files
    ((num_files++))
    
    # Search for the string in the current file and count matching lines
    matching_lines=$(grep -c "$searchstr" "$file")
    ((num_matching_lines += matching_lines))
 done < <(find "$filesdir" -type f)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

