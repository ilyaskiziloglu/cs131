#!/bin/bash

if [ -f ./train/cleandata.csv ] 
then
rm ./train/cleandata.csv
fi

NUM=$(wc -l < ./winetasting.csv)
TRSIZEf=$(echo "($NUM-1)*0.8" | bc)
TRSIZE=${TRSIZEf%.*} #to turn into int, can also div by 1
echo $TRSIZE

i=0
while read line
do
	if [ $i -eq 0 ]
	then
	HEAD=$line
	elif [ $i -eq $TRSIZE ]
	then 
	echo $HEAD > ./test/cleandata.csv
	fi

	if [ $i -le $TRSIZE ]
	then
	echo $line >> ./train/cleandata.csv
	else
	echo $line >> ./test/cleandata.csv
	fi
	((i++))
done < ./winetasting.csv

echo $TRSIZE

sed -i 's/;/,/g' train/cleandata.csv
sed -i 's/;/,/g' test/cleandata.csv

awk -f awkfile.awk train/cleandata.csv > train/d2.csv
mv train/d2.csv train/cleandata.csv
awk -f awkfile.awk test/cleandata.csv > test/d2.csv
mv test/d2.csv test/cleandata.csv
