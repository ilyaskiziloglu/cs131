#!/bin/bash

cp winetasting.csv TESTwinetaste.csv
cp winetasting.csv TRAINwinetaste.csv

filelength=$(wc -l < winetasting.csv)

echo "File length: $filelength"

eightypercenttokeep=$(echo "$filelength * 0.8" | bc) ; echo ${eightypercenttokeep%\.*}

echo "80%: $eightypercenttokeep"

lasttwentypercent=$( echo "$filelength - $eightypercenttokeep" | bc)
twentypercentcleanedup=$(echo "$lasttwentypercent%\.*")

echo "Twenty cleaned up: $twentypercentcleanedup"


echo "Last 20%: $lasttwentypercent"

#Need to apply the above commands to the file to retain/change the number of lines, etc 

#Replacing the semicolon delimeter with a comma for both of the above files
sed -i 's/;/,/g' TESTwinetaste.csv
sed -i 's/;/s/g' TRAINwinetaste.csv 

#Change the test/train files to only have certain lines 
tail -n $lasttwentypercent TESTwinetaste.csv
head -n $eightypercentokeep TRAINwinetaste.csv

fileheader=$(head -n 1) winetaste.csv

paste -s -d fileheader TESTwinetaste.csv
