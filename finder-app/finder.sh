#!/bin/bash

#this script looks for matching strings, arg1 is the path to the file or directory to be searched
# arg2 is the string to be matched

#variables 
filesdir="$1"
path="${filesdir%.*}"
searchstr="$2"



#check if necessary arguments are passed to the script.
if [[ -z "$1" ]]; then
	echo "arg 1 (file dir is missing)"
	exit 1
fi

if [[ -z "$2" ]]; then
	echo "arg 2 (string is missing)"
	exit 1
fi



#check if path is valid 

if [[ -f  "$filesdir" ]]; then
	#statements
	echo "path inccorect (points to a file)"
	echo "provide a valid path "
	exit 1

fi


if [[ -d "$filesdir" ]]; then

	#using grep with -r option to search in current and all sub dir
	#get the number of matching files
	Nmatching_files=$(grep -r -l -H "$searchstr" "$path" | wc -l)

	#get the number of matching lines 
	Nmatching_lines=$(grep -r -c -h "$searchstr" "$path" | awk '{s+=$1} END {print s}')

	echo "The number of files are $Nmatching_files and the number of matching lines are $Nmatching_lines" 


else
	echo "path does not exist"
	echo "$filesdir"
	exit 1
fi
