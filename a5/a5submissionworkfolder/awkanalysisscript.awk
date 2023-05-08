#Goal of this script is to count and display layoffs by county

BEGIN{
	FS=","
	OFS=","
}

{
counties[$1]+= $2
#print Number of Ocurrences, County
#What I really want to be able to print here is # of lay offs, County. Need to find a way to sum 
#with respect to middle column. Could I possibly add to a third array county & sums? 
}

END {
for (i in counties)
print counties[i], i 
}

