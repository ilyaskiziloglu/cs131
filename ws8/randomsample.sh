#!/bin/bash

if [ $# -gt 2 -o $# -lt 2 -o $1 -lt 1 -o $1 -gt 99 -o $2 == "" ]; #needs [] b/c test alias 
then
	echo "Issue with argument! Returning..."
	return 1
fi

#RANDOM=13 replaced in favor of shuf? 

shuf -n $1 $2

