#THIS FILE SHOULD ONLY BE USED FOR TESTING/DEVELOPMENT. IT DOES NOT WORK


#Goal of this awk file is to cut the 7th and 8th columns out of the csv file. 
#However, because spacing in that file is variable, the 7th and 8th columns tend to 
#Either be correct (no issue) or it shows 6 and 7. Goal os this script is 
#To ensure that the correct columns are always consumed


#NOTE: As of now (5/4 @ 6:35) this is not being used due to inconsistent behavior on 
#the warn_csv. This can potentially be used on the dumpy smaller copy of the csv. 
BEGIN{
	FS=","
	OFS=","
}

{
if (NR <= 6) {print $0}
#if (NR > 6 && ($7 != "Layoff Permanent" || $7 != "Closure Permanent")) {print $7 " " $8}
#else if (NR > 6 && ($7 == "Layoff Permanent" || $7 == "Closure Permanent")) {print $8 " " $9}

#if (NR > 6 && ($7 !~/Layoff/ || $7 !~/Closure/)) {print $7 " " $8}
if (NR > 6 && $7 !~/Layoff/ || NR > 6 && $7 !~/Closure/) {print $7,$8}
#if (NR > 6 && $7 ~/Layoff/ || NR > 6 && $7 ~/Closure/) {print $8,$9}
#else (print $8,$9)
}
