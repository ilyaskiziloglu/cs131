#Goal of this script is to get the county column
#Another script (not this one) should count and display layoffs by county
BEGIN{
	FS=","
	OFS=","
}

{
#The next two lines, as is, will print the county only. 
#Kind of a useful/funny coincidence but not helpful for the end purpose

if (NR > 6 && $1 !~/CA/ && $1 !~ /Layoff/ && $1 !~/Closure/) {print $1}
else if (NR > 6 && $2 !~/CA/ && $2 !~ /Layoff/ && $2 !~/Closure/) {print $2} 

}

