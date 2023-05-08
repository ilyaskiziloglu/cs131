#The below script is intended to get the county name as well as the layoff count
#and zip code

BEGIN{
	FS=","
	OFS=","
}

{
if (NR <= 6) {print $0}

if (NR > 6 && $1 !~/CA/ && $1 !~ /Layoff/ && $1 !~/Closure/) {print $1}
else if (NR > 6 && $2 !~/CA/ && $2 !~ /Layoff/ && $2 !~/Closure/) {print $2} 

}

