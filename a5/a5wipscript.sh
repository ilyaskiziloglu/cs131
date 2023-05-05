#!/bin/bash

#For eventual easy restarting of the program
#if [ -f ./warnanalysis/ ] 
#then
#rm ./warn_analysis/*.csv
#fi

cp warn_report.csv ./warnanalysis/warncopy.csv

warnheader=$(head -n 6 warn_report.csv)

echo "$warnheader" > ./warnanalysis/warnheaderfile.csv

filelength=$(wc -l < warn_report.csv)

echo "Warn Report file length: $filelength"

#QUESTION
#Would changing the percentages between test/train yield different results in a meaningful way? 

eightypercenttokeep=$(echo "($filelength * 0.8)/1" | bc)

echo "80%: $eightypercenttokeep"

lasttwentypercent=$(echo "$filelength - $eightypercenttokeep" | bc)

echo "Last 20%: $lasttwentypercent"

#Shuffle the warncopy file to ensure random distribution
#Change the test/train files to only have certain lines

tail -n (echo "($filelength - 6)/1" | bc) warncopy.csv > warncopywithoutheader.csv
shuf warncopywithoutheader.csv

tail -n $lasttwentypercent warncopywithoutheader.csv > ./warnanalysis/test/warntest.csv
head -n $eightypercenttokeep warncopywithoutheader.csv > ./warnanalysis/train/warntrain.csv

#To append shuffled test data under the header
cp ./warnanalysis/warnheaderfile.csv ./warnanalysis/testheaderfile.csv
cat ./warnanalysis/test/warntest.csv >> ./warnanalysis/testheaderfile.csv

#To append shuffled train data under the header
cp ./warnanalysis/warnheaderfile.csv ./warnanalysis/trainheaderfile.csv
cat ./warnanalysis/train/warntrain.csv >> ./warnanalysis/trainheaderfile.csv
