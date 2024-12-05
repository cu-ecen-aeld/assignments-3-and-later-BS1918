#!/bin/bash

#this script looks for matching strings, arg1 is the path to the file or directory to be searched
# arg2 is the string to be matched

#variables 
filesdir="$1"
filename=$(basename "$filesdir")
str="$2"



#check if necessary arguments are passed to the script.
if [[ -z "$1" ]]; then
	echo "arg 1 (file dir is missing)"
	exit 1
fi

if [[ -z "$2" ]]; then
	echo "arg 2 (string is missing)"
	exit 1
fi

echo "$filesdir"
echo "$filename"
echo "$str"

mkdir -p "$(dirname "$filesdir")" && echo "$str" > "$filesdir"

