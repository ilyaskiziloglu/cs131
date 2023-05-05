#!/bin/bash

NUM=$(wc -l < $1)
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
	echo $HEAD > ./rwine/test/cleandata.csv
	fi

	if [ $i -le $TRSIZE ]
	then
	echo $line >> ./rwine/train/cleandata.csv
	else
	echo $line >> ./rwine/test/cleandata.csv
	fi
	((i++))
done < $1

#./mysplit.sh rwine/binary.csv rwine
