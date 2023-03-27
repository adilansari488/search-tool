#!/bin/bash

usage() {
  echo -e "\nUsage: $0 <file_pattern> <search_pattern>"
  echo "  <file_pattern>   : A pattern to match the name of the files to search."
  echo "                     The pattern can include wildcards (*) to match multiple files."
  echo "  <search_pattern> : A string to search for in the contents of the files."
  echo ""
  echo -e "Example: $0 '*.txt' 'error'\n"
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  usage
  exit 0
fi

if [ $# -ne 2 ]; then
  echo "Error: Invalid number of arguments."
  usage
  exit 1
fi

filepattern=$1  # This is first command line argument
pattern=$2      # This is second command line argument
files=$(find . -maxdepth 1 -type f -name "$filepattern")

for file in $files
do
        echo searching in $file
        if file $file | grep -iq "gzip compressed"
        then
                tar -xzf $file -O | grep -i "$pattern"
        elif file $file | grep -iq "text"
        then
                cat $file | grep -i "$pattern"
        else
                echo "It is not a text file type to search in. Please check your inputs or debug the script"
        fi

done
echo "Searching in all files done"
