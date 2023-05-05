#This script SEEMS to work. Will need to double check but likely in a good place

BEGIN{
	FS=","
	OFS=","
}

{
if (NR <= 6) {print $0}

if (NR > 6 && $1 !~/CA/ && $1 !~ /Layoff/ && $1 !~/Closure/) {print $1}
else if (NR > 6 && $2 !~/CA/ && $2 !~ /Layoff/ && $2 !~/Closure/) {print $2} 


#if (NR > 6 && ($7 !~/Layoff/ || $7 !~/Closure/)) {print $7 " " $8}
#if (NR > 6 && $7 !~/Layoff/ || NR > 6 && $7 !~/Closure/) {print $7,$8}
#if (NR > 6 && $7 ~/Layoff/ || NR > 6 && $7 ~/Closure/) {print $8,$9}
#else (print $8,$9)
}

