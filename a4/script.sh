#!/bin/bash

cp winetasting.csv TESTwinetaste.csv
cp winetasting.csv TRAINwinetaste.csv

fileheader=$(head -n 1 winetasting.csv | sed 's/;/,/g')

echo "$fileheader" > fileheaderfile.csv

#Edit 4_24: Going to flip the order of these to get header put on top
#grep fixed fileheaderfile.csv >> TESTwinetaste.csv


#This was an attempt to move the header from the bottom of the file to the top
#sed -i '1h;1d;$!H;$!d;G' TESTwinetaste.csv 

filelength=$(wc -l < winetasting.csv)

echo "File length: $filelength"

eightypercenttokeep=$(echo "($filelength * 0.8)/1" | bc)

echo "80%: $eightypercenttokeep"

lasttwentypercent=$(echo "$filelength - $eightypercenttokeep" | bc)

echo "Last 20%: $lasttwentypercent"

#Change the test/train files to only have certain lines

tail -n $lasttwentypercent winetasting.csv > TESTwinetaste.csv
head -n $eightypercenttokeep winetasting.csv > TRAINwinetaste.csv


#Need to apply the above commands to the file to retain/change the number of lines, etc 
#Replacing the semicolon delimeter with a comma for both of the above files
sed -i 's/;/,/g' TESTwinetaste.csv
sed -i 's/;/,/g' TRAINwinetaste.csv 

#Test to ensure sed data cleansing functions properly
#echo "TEST CLEANED TEST"
#less TESTwinetaste.csv | head -n 15
#echo "TRAIN CLEANED TEST"
#less TRAINwinetaste.csv | head -n 15


#Need to attach the header line to each of the files
#paste -s -d fileheader TESTwinetaste.csv

#paste -s  $fileheader TESTwinetaste.csv > dumpytest.txt

#To append the TESTdata under the header
cat TESTwinetaste.csv >> fileheaderfile.csv

mv fileheaderfile.csv TESTwinetaste.csv

#echo "$fileheader" >> TESTwinetaste.csv

#To move the files from the a4 directory into their respective test & train folders 
mv TRAINwinetaste.csv  /home/ilyas_kiziloglu/cs131/a4/train/TRAINwinetaste.csv
mv TESTwinetaste.csv /home/ilyas_kiziloglu/cs131/a4/test/TESTwinetaste.csv
